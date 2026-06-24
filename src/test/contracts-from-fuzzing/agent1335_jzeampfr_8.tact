struct NestedStruct {
    opt1: Int?;
    opt2: Bool?;
}

struct Wrapper {
    nested: NestedStruct;
}

contract StructWithOptionalStruct {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            nested: NestedStruct{ opt1:null, opt2:null }
        };
    }
}