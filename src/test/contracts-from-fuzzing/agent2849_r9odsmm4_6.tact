struct OptionalNested {
    some: Int;
}

struct Container {
    nested: OptionalNested?;
    name: String;
}

contract OptionalStructField {
    storageField: Container;

    init() {
        self.storageField = Container{
            nested: null,
            name: "Hello"
        };
    }
}