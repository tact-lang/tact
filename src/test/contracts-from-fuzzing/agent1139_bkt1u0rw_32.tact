struct MidLevel {
    lvl: LowLevel?;
    ival: Int;
}
struct LowLevel {
    bval: Bool;
    sval: String?;
}

contract MixedStructDeeper {
    val: MidLevel;
    
    init() {
        self.val = MidLevel{
            lvl: LowLevel{ bval: true, sval: null },
            ival: 42
        };
    }
}