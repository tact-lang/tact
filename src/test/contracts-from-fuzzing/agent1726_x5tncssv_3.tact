struct OptWrap {
    num: Int?;
    flag: Bool?;
}

contract WithOptionals {
    a: Int?;
    b: Bool?;
    c: OptWrap;
    
    init() {
        self.a = null;
        self.b = true;
        self.c = OptWrap{
            num: null,
            flag: false,
        };
    }
}