struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
}

contract ManyFlags {
    flags: Flags;

    init() {
        self.flags = Flags{
            f1:true, f2:true, f3:false, f4:true, f5:false,
            f6:true, f7:false, f8:false, f9:true, f10:true
        };
    }
}