struct DeepNested {
    z: Bool;
    w: String;
}

struct Nested {
    x: Int;
    y: DeepNested;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            x: 10,
            y: DeepNested{
                z: true,
                w: "wow",
            },
        };
    }

    receive() {}
}