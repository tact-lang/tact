struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct NestedStruct {
    optStruct: InnerOpt?;
    plainVal: Int;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            optStruct: null,
            plainVal: 999
        };
    }
}