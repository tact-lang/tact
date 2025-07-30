struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

contract ContractWithMultiple {
    sa: StructA;
    sb: StructB;
    simple: Int;
    flag: Bool;
    optS: StructB?;
    text: String;

    init() {
        self.sa = StructA{ a:1 };
        self.sb = StructB{ b:2 };
        self.simple = 3;
        self.flag = true;
        self.optS = null;
        self.text = "test";
    }
}