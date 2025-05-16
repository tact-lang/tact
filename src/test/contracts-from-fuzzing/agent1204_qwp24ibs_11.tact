// Struct with large number of boolean fields, some optional
struct Flags {
    f1: Bool;
    f2: Bool;
    f3: Bool?;
    f4: Bool;
    f5: Bool?;
    f6: Bool;
    f7: Bool;
    f8: Bool?;
    f9: Bool;
    f10: Bool?;
}

contract BoolFlags {
    flags: Flags;

    init() {
        self.flags = Flags{
            f1:true,f2:false,f3:null,f4:true,f5:null,f6:false,f7:true,f8:null,f9:false,f10:null
        };
    }
}