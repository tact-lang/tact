struct MaybeFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
}

contract OptBoolFlags {
    flags: MaybeFlags;

    init() {
        self.flags = MaybeFlags{
            f1:true, f2:null, f3:false, f4:null, f5:true
        };
    }

    receive() {}
}