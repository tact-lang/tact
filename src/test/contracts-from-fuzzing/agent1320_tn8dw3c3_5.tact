struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String?;
    f10: String;
}

contract LargeStruct {
    data: ManyFields = ManyFields{
        f1:1, f2:true, f3:"a", f4:null, f5:null,
        f6:"b", f7:2, f8:false, f9:null, f10:"c"
    };

    receive() {
        self.data = ManyFields{
            f1:42, f2:false, f3:"x", f4:5, f5:true,
            f6:"y", f7:99, f8:true, f9:"z", f10:"q"
        };
    }
}