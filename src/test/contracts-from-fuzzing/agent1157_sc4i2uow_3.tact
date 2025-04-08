struct DeepInner {
    z: Int;
    opt: Bool?;
}

struct Nested {
    inner: DeepInner;
    message: String;
}

contract DeepTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: DeepInner{ z: 42, opt: false },
            message: "test"
        };
    }
}