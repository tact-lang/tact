message(1) FooMsg { foo: Int; }

struct Nested {
    bar: FooMsg;
    optMsg: FooMsg?;
}

struct Container {
    nest: Nested;
    note: String?;
}

contract DeepMix {
    val: Container;
    init() {
        self.val = Container{
            nest: Nested{ bar: FooMsg{ foo: 5 }, optMsg: null },
            note: null
        };
    }
}