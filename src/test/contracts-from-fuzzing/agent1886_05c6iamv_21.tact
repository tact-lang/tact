struct MultiOptionalNested {
    a: Int?;
    b: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: String?;
    z: Bool?;
}

contract TestMultiOptNested {
    data: MultiOptionalNested;

    init() {
        self.data = MultiOptionalNested{
            a: null,
            b: InnerStruct{
                x: 5,
                y: null,
                z: true
            }
        };
    }
}