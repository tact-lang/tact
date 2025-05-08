struct NestedString {
    x: String;
}

struct OptionalStringStruct {
    n: NestedString?;
}

contract OptionalNestedString {
    s: OptionalStringStruct;

    init() {
        self.s = OptionalStringStruct{
            n: null,
        };
    }
}