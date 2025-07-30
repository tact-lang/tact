struct Inner { val: Int; }

struct Outer {
    inner: Inner?;
    count: Int;
}

contract NestedOptionalStructFields {
    state: Outer?;

    init() {
        self.state = null;
    }
}
