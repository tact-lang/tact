struct BoolFlags {
    f0: Bool; f1: Bool; f2: Bool; f3: Bool; f4: Bool;
    f5: Bool; f6: Bool; f7: Bool; f8: Bool; f9: Bool;
}

contract FlagsOnly {
    bits: BoolFlags;

    init() {
        self.bits = BoolFlags{
            f0:true,f1:false,f2:true,f3:false,f4:true,
            f5:false,f6:true,f7:false,f8:true,f9:false
        };
    }
}