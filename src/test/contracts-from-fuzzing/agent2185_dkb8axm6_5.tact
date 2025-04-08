struct OptInDeep {
    innerNum: Int;
    maybeStr: String?;
}

struct HasOptionInStruct {
    opt: OptInDeep?;
}

contract StructWithOptInStruct {
    state: HasOptionInStruct;

    init() {
        self.state = HasOptionInStruct{ opt: null };
    }
}