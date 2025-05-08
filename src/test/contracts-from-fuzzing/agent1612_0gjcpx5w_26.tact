struct EmptyNestedWithOptional {
    name: String?;
}

struct Container {
    inside: EmptyNestedWithOptional;
}

contract NullStringNested {
    content: Container;

    init() {
        self.content = Container{
            inside: EmptyNestedWithOptional{
                name: null,
            }
        };
    }
}
