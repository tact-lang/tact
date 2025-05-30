struct MixOptDef {
    a: Int = 0;
    b: Bool?;
    c: String = "";
    d: Int?;
}

contract MixOptDefaults {
    val: MixOptDef = MixOptDef{ a:1,b:null,c:"z",d:2 };

    init() {
        self.val = MixOptDef{ a:10,b:true,c:"qq",d:null };
    }
}