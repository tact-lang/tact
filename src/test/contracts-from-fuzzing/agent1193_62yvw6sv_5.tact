struct NestedOptional {
    inner: Int?;
    name: String?;
}

struct Container {
    nested: NestedOptional?;
}

contract NestedOptionalContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptional{
                inner: 7,
                name: null,
            },
        };
    }
}