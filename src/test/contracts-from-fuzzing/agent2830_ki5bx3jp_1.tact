struct InnerStruct {
    nestedOptional: Int?;
    flag: Bool;
}

struct OuterStruct {
    id: Int;
    name: String;
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            id: 1,
            name: "test",
            inner: InnerStruct{
                nestedOptional: null,
                flag: true,
            },
            optionalInner: null,
        };
    }
}