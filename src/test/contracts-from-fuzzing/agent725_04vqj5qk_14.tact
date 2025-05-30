struct FlatStruct {
    a: Int;
    b: Int;
}

contract StructList {
    f1: FlatStruct;
    f2: FlatStruct;
    f3: FlatStruct;

    init() {
        self.f1 = FlatStruct{a:1,b:2};
        self.f2 = FlatStruct{a:3,b:4};
        self.f3 = FlatStruct{a:5,b:6};
    }
}