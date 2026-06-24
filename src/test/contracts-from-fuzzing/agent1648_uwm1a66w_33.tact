struct Rec {
    opt: Int?;
    num: Int;
}

contract OptInStruct {
    r: Rec;

    init() {
        self.r = Rec{ opt:null, num:42 };
    }
}