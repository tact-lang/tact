struct DeepNested {
    nestedField: NestedLevel;
}

struct NestedLevel {
    x: Int;
    y: Bool;
    z: String;
}

contract DeepNestTest {
    info: DeepNested;

    init() {
        self.info = DeepNested{nestedField: NestedLevel{x: 5, y: false, z: "deep"}};
    }
}