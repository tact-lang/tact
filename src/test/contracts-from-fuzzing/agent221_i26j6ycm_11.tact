struct WideStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: String;
    f9: String;
    f10: String;
    f11: Bool;
    f12: Int;
}

contract WidePersistentContract {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1:1, f2:2, f3:3, f4:4, f5:5,
            f6:true, f7:false,
            f8:"a", f9:"b", f10:"c",
            f11:true, f12:12
        };
    }
}