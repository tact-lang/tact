struct NestedOptional {
    foo: Int?;
    bar: String?;
}

struct Container {
    nested: NestedOptional;
    val: Bool;
}

contract OptionalContract {
    state: Container;

    init() {
        self.state = Container{
            nested: NestedOptional{
                foo: null,
                bar: null,
            },
            val: true,
        };
    }
}