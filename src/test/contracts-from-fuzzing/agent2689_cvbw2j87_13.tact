struct DeeplyNestedOptional {
    foo: InnerLevel?;
}

struct InnerLevel {
    bar: Leaf?;
}

struct Leaf {
    baz: Int?;
}

contract OptionalNestContract {
    state: DeeplyNestedOptional;

    init() {
        self.state = DeeplyNestedOptional{
            foo: InnerLevel{
                bar: Leaf{
                    baz: null,
                },
            },
        };
    }
}