struct Inner {
    foo: Int;
}

struct Outer {
    maybeInner: Inner?; 
    val: Int;
}

contract OptStructStorage {
    outer: Outer = Outer{
        maybeInner: null,
        val: 5,
    };
}