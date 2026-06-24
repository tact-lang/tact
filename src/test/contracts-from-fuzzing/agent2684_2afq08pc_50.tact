struct IntOptStruct {
    v1: Int;
    v2: Int?;
}

contract IntOptCombo {
    f: IntOptStruct = IntOptStruct{v1:1, v2:null};

    init() {
        self.f = IntOptStruct{v1:2, v2:3};
    }
}
