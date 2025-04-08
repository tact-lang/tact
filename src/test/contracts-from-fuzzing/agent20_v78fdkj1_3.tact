struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    field1: Int;
    nested: Inner;
    flag: Bool;
}

contract DeepNested {
    storage: Outer = Outer{field1: 1, nested: Inner{a: 2, b: false}, flag: true};

    receive() {
        self.storage = Outer{field1: 3, nested: Inner{a: 4, b: true}, flag: false};
    }
}