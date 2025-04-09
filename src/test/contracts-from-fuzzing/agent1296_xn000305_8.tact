struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: NestedOptional;
    flag: Int;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptional{
                x: null,
                y: true,
            },
            flag: 99,
        };
    }
}