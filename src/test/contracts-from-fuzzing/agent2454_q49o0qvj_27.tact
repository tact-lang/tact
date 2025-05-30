struct ManyOptionalFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
}

contract ManyOptionFlagsTest {
    flags: ManyOptionalFlags;

    init() {
        self.flags = ManyOptionalFlags{
            f1:null,f2:null,f3:null,f4:null,f5:null
        };
    }
}