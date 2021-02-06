package yakt;

import haxe.ds.StringMap;
import haxe.Constraints.IMap;

class StringishMap<K, V> implements IMap<K, V> {
	private var _data:StringMap<V>;
	private var _adapter:StringAdapter<K>;

	public function new(adapter:StringAdapter<K>, ?data:StringMap<V>) {
		if (data == null) {
			data = new StringMap<V>();
		}
		_data = data;
		_adapter = adapter;
	}

	public function get(k:K):Null<V> {
		return _data.get(_adapter.toString(k));
	}

	public function set(k:K, v:V):Void {
		return _data.set(_adapter.toString(k), v);
	}

	public function exists(k:K):Bool {
		return _data.exists(_adapter.toString(k));
	}

	public function remove(k:K):Bool {
		return _data.remove(_adapter.toString(k));
	}

	public function keys():Iterator<K> {
		var i = _data.keys();
		var ti = new IteratorAdapter(i, _adapter.fromString);
		return ti;
	}

	public function iterator():Iterator<V> {
		return _data.iterator();
	}

	public function keyValueIterator():KeyValueIterator<K, V> {
		var i = _data.keyValueIterator();
		var ti = new IteratorAdapter(i, keyValueTransform);
		return ti;
	}

	private function keyValueTransform(kv:{key:String, value:V}) {
		return {
			key: _adapter.fromString(kv.key),
			value: kv.value
		};
	}

	public function copy():IMap<K, V> {
		return new StringishMap(_adapter, _data.copy());
	}

	public function toString():String {
		return _data.toString();
	}

	public function clear():Void {
		return _data.clear();
	}
}
