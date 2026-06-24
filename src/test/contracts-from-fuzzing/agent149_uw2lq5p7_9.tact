struct OptionalNested {
    n: NestedOptional?;
}

struct NestedOptional {
    flag: Bool;
}

contract OptionalNest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            n: NestedOptional{ flag: false }
        };
    }
}