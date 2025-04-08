struct DeeplyNested {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    c: Bool;
    d: Innermost;
}

struct Innermost {
    x: Int;
    y: Bool;
}

contract NestedStorage {
    nestedField: DeeplyNested;

    init() {
        self.nestedField = DeeplyNested{
            a: 1,
            b: InnerStruct{
                c: true,
                d: Innermost{
                    x: 10,
                    y: false,
                },
            },
        };
    }
}