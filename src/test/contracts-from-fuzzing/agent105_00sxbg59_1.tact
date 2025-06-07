struct InnerStruct {
    a: Int;
    b: Bool?;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
}

contract NestedStructContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{
                a: 10,
                b: true,
            },
            flag: false,
        };
    }
}