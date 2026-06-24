struct InnerStruct {
    foo: Int = 1;
}

struct OuterStruct {
    bar: Int = 2;
    innerStruct: InnerStruct = InnerStruct{};
}

contract FullDefaultDeep {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{};
    }
}