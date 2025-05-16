struct Inner { val: Int?; }
struct Outer { inner: Inner?; }

contract OptionalNestedOptionals {
    s: Outer? = null;
}