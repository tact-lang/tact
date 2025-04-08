struct MixOptInStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract DirectOptionals {
    mia: Int?;
    mib: Bool?;
    mis: String?;
    nested: MixOptInStruct;

    init() {
        self.mia = 10;
        self.mib = null;
        self.mis = "hi";
        self.nested = MixOptInStruct{ a:1, b:true, c:"ccc" };
    }
}