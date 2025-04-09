struct NestedStruct {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract NestedStructInField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 1,
            b: InnerStruct{
                x: 2,
                y: 3,
            },
        };
    }
}