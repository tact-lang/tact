contract DeepNestedOptionalTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}

struct OptionalStruct {
    a: Int?;
    b: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}
