struct ComplexStruct {
    value1: Int;
    flag1: Bool?;
    value2: Int;
    flag2: Bool?;
    text: String;
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool?;
    count: Int;
}

contract StoreVariants {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            value1: 1,
            flag1: null,
            value2: 2,
            flag2: true,
            text: "Hello",
            b: false,
            inner: InnerStruct{
                flag: true,
                count: 42,
            },
        };
    }
}