struct WideStruct {
    f1: Int; f2: Int; f3: Bool; f4: Bool; f5: String; f6: String; f7: Int; f8: Int; f9: Bool; f10: Bool;
}

contract WideFields {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1:1, f2:2, f3:true, f4:false, f5:"a", f6:"b", f7:3, f8:4, f9:true, f10:false
        };
    }
}
