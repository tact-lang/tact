struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;
    x: Int;
}

contract NestedOptStruct {
    data: Outer;

    init() {
        self.data = Outer{ nested: null, x: 10 };
    }

    receive() {}
}