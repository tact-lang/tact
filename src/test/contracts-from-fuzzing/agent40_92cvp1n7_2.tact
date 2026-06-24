struct InnerStruct {
    flag: Bool;
    value: Int;
}

struct OuterStruct {
    nested: InnerStruct;
    optionalNumber: Int?;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{flag: true, value: 42},
            optionalNumber: null,
        };
    }
}