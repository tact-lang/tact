struct DeepNested {
    a: Int;
    b: String?;
}

struct MiddleNested {
    x: DeepNested;
    y: Bool;
}

struct Outer {
    first: MiddleNested;
    second: DeepNested;
    optThird: MiddleNested?;
}

contract TestContract {
    complexField: Outer;

    init() {
        self.complexField = Outer{
            first: MiddleNested{
                x: DeepNested{ a: 1, b: null },
                y: true,
            },
            second: DeepNested{ a: 2, b: "abc" },
            optThird: null,
        };
    }
}