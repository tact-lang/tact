struct Inner { x: Int = 123; }

struct Outer { inner: Inner?; }

contract OptionalNestedStruct {
    s: Outer = Outer{ inner: null };
}