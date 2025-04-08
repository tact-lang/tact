struct NestedOptional {
    value: Int?;
    text: String;
}

struct Container {
    item: NestedOptional?;
    flag: Bool;
}

contract OptionalNest {
    content: Container;

    init() {
        self.content = Container{
            item: null,
            flag: true,
        };
    }

    receive() {}
}
