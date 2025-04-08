struct OptionalStringBool {
    name: String?;
    exists: Bool?;
}

struct Container {
    part: OptionalStringBool;
}

contract OptionalNestedStruct {
    inner: Container;

    init() {
        self.inner = Container{
            part: OptionalStringBool{
                name: null,
                exists: false,
            },
        };
    }
}