struct NestedStruct {
    inner: StructInside;
    optInt: Int?;
}

struct StructInside {
    x: Int;
    y: Bool;
}

contract UseNested {
    data: NestedStruct = NestedStruct{
        inner: StructInside{ x: 5, y: true },
        optInt: null
    };

    init() {
        self.data = NestedStruct{
            inner: StructInside{ x: 7, y: false },
            optInt: 10
        };
    }
}
