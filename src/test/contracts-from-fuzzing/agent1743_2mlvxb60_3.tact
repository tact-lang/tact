struct Inner {
    z: Int?;
}

struct Outer {
    inner: Inner?;
}

contract NestedOptionalStructs {
    data: Outer?;

    init() {
        self.data = null;
    }
}