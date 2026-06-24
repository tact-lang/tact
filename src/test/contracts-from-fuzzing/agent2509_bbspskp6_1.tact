struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

contract DeepOne {
    innerField: Inner;
    num: Int;
    flag: Bool;
    opt: Int?;

    init() {
        self.innerField = Inner{a: 1, b: true, c: null};
        self.num = 42;
        self.flag = false;
        self.opt = null;
    }
}