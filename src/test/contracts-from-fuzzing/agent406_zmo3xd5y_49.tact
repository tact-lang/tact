struct RecWithOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract ComplexOptional {
    foo: RecWithOpt;
    bar: Int?;
    str: String?;
    flag: Bool?;
    init() {
        self.foo = RecWithOpt{a:null,b:true,s:"hi"};
        self.bar = 7;
        self.str = null;
        self.flag = false;
    }
}