struct LotsOfFlags {
    f1: Bool;
    f2: Bool?;
    f3: Bool;
    f4: Bool?;
    f5: Bool;
    f6: Bool?;
    f7: Bool;
    f8: Bool?;
    f9: Bool;
    f10: Bool?;
}

contract TestContract {
    flags: LotsOfFlags;

    init() {
        self.flags = LotsOfFlags{
            f1:true,f2:null,f3:false,f4:null,f5:true,
            f6:null,f7:false,f8:null,f9:true,f10:null
        };
    }
}