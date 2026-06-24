struct DeeplyNestedOptional {
    a: Int?;
    b: Bool?;
    nested: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    y: Bool;
}

contract TestNestedOptional {
    data: DeeplyNestedOptional;

    init() {
        self.data = DeeplyNestedOptional{
            a: null,
            b: null,
            nested: null,
        };
    }
}
