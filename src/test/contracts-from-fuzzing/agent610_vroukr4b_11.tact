struct Sub {
    one: Int;
    two: Bool;
    three: String;
}

contract MultiFields {
    n: Int;
    b: Bool;
    s: String;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    sub: Sub;
    optSub: Sub?;

    init() {
        self.n = 5;
        self.b = true;
        self.s = "test";
        self.opt1 = null;
        self.opt2 = false;
        self.opt3 = null;
        self.sub = Sub{ one:1, two:true, three:"s" };
        self.optSub = null;
    }
}