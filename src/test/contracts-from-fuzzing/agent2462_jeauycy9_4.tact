struct S1 {
    f1: Int;
    f2: Bool?;
    f3: String;
}

contract TestContract {
    s: S1;
    b: Bool;
    n: Int?;
    str: String;
    flag: Bool?;

    init() {
        self.s = S1{f1: 10, f2: null, f3: "hello"};
        self.b = true;
        self.n = null;
        self.str = "world";
        self.flag = false;
    }
}