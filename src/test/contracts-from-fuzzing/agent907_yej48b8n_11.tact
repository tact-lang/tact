struct OnlyOptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalStructPersistent {
    s: OnlyOptionalStruct;

    init() {
        self.s = OnlyOptionalStruct{a:null,b:null,c:null};
    }
}