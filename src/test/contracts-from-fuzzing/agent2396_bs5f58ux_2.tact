struct Nested {
    x: Int;
    y: Bool?;
    z: String;
}

struct Container {
    data: Nested;
    flag: Bool;
}

contract DeepNest {
    content: Container;

    init() {
        self.content = Container{
            data: Nested{
                x: 123,
                y: null,
                z: "hello"
            },
            flag: true
        };
    }
}