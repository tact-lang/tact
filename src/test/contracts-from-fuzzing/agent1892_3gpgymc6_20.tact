struct FlatDefault {
    i: Int = 5;
    b: Bool = false;
    s: String = "abc";
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract FlatDef {
    d: FlatDefault;
    
    init() {
        self.d = FlatDefault{};
    }
}