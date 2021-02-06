package yakt;

class IteratorAdapter<K, V> {
	private var _iterator:Iterator<K>;
	private var _adapter:K->V;

	public function new(iterator:Iterator<K>, adapter:K->V) {
		_iterator = iterator;
		_adapter = adapter;
	}

	public function hasNext() {
		return _iterator.hasNext();
	}

	public function next() {
		return _adapter(_iterator.next());
	}
}
