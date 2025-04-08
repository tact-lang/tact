struct InnerStruct {
    f1: Int;
    f2: Bool;
}

struct OuterStruct {
    inr: InnerStruct;
}

contract StructInStruct {
    state: OuterStruct;
    init() {
        self.state = OuterStruct{inr: InnerStruct{f1: 10, f2: true}};
    }
}