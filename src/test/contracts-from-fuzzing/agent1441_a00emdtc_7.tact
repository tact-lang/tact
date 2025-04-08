struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Container {
    nested: NestedOptional;
    text: String;
}

contract NestedOptionalTest {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptional{a: null, b: null},
            text: "hi"
        };
    }

    receive() {
        self.data = Container{
            nested: NestedOptional{a: 99, b: true},
            text: "bye"
        };
    }
}