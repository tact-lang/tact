struct StringOptDef {
    a:String = "hi";
    b:String?;
}

contract OptionalDefaults {
    s: StringOptDef;

    init() {
        self.s = StringOptDef{ a: "hi", b:null };
    }
}