struct InnerMost {
    flag: Bool?;
    val: Int;
}

struct Inner {
    foo: InnerMost;
    s: String;
}

struct Top {
    nested: Inner;
    b: Bool;
    intVal: Int;
}

contract MultiNested {
    data: Top;

    init() {
        self.data = Top{
            nested: Inner{
                foo: InnerMost{flag: null, val: 3},
                s: "str",
            },
            b: true,
            intVal: 123,
        };
    }

    receive() {}
}