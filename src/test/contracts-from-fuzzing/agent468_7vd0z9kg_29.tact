// Test nested optional struct with multiple fields
struct DeepNest {
    label: String;
    flag: Bool;
}

struct Container {
    nested: DeepNest?;
    message: String;
}

contract OptionalDeepNestTest {
    obj: Container;

    init() {
        self.obj = Container{
            nested: null,
            message: "hi"
        };
    }
}