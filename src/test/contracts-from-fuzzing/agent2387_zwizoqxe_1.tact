struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    optionalValue: Int?;
    flag: Bool;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                optionalValue: null,
                flag: true,
            }
        };
    }
}