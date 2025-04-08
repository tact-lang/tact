struct Inner { val: Int; }
struct Outer { inner: Inner; }

contract NestedOptionals {
    field: Outer?;
}