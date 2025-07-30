struct Base {
    foo: Int;
}

struct SecondLevel {
    inner: Base;
    bar: Bool;
}

struct ThirdLevel {
    nested: SecondLevel;
    text: String;
}

struct FourthLevelOptional {
    maybe: ThirdLevel?;
}

contract ComplexOptionalNestContract {
    val: FourthLevelOptional;

    init() {
        self.val = FourthLevelOptional{
            maybe: ThirdLevel{
                nested: SecondLevel{
                    inner: Base{foo:12},
                    bar: true,
                },
                text: "yo",
            },
        };
    }
}