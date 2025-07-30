struct OptionalStruct {
    nested: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract OptTest {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{ nested: null };
    }
}