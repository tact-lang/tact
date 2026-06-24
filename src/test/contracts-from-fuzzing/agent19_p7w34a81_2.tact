struct DeepNested {
    x: Int;
    y: Bool?;
    s: String;
}

struct Container {
    nested: DeepNested;
    flag: Bool;
    description: String?;
}

contract ComplexNestedContract {
    info: Container;

    init() {
        self.info = Container{
            nested: DeepNested{
                x: 7,
                y: false,
                s: "sample",
            },
            flag: true,
            description: null,
        };
    }
}