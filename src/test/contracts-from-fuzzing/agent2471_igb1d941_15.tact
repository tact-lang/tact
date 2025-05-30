struct OptionalNestedStruct {
    s: SubStruct?;
}

struct SubStruct {
    a: Int;
    b: Bool;
}

contract OptNestedField {
    st: OptionalNestedStruct;

    init() {
        self.st = OptionalNestedStruct{
            s: SubStruct{
                a: 55,
                b: false,
            },
        };
    }
}