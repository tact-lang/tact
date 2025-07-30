struct InnerStruct {
    val1: Int;
    val2: Bool;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
}

contract TestContract {
    nestedOuter: OuterStruct;

    init() {
        self.nestedOuter = OuterStruct{
            nested: InnerStruct{val1: 10, val2: false},
            flag: true,
        };
    }
}