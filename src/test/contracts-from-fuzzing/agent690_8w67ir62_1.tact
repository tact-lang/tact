struct DeepNested {
    first: Int;
    second: Inner;
}

struct Inner {
    a: Int?;
    b: Deeper;
}

struct Deeper {
    val: Bool;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            first: 1,
            second: Inner{
                a: null,
                b: Deeper{val: true},
            },
        };
    }
}