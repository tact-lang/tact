struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Bool?;
    f6: Int?;
    f7: String?;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1:1, f2:2, f3:true, f4:"hi", f5:null, f6:null, f7:null, f8:true, f9:"yo", f10:99,
        };
    }
}
