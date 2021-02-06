package yakt;

typedef StringAdapter<T> = {
	toString:T->String,
	fromString:String->T
}
