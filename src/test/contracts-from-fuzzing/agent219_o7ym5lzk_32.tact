struct A {
    s: String;
    i: Int;
    b: Bool;
}

contract OptBetweenConsts {
    a: A?;
    i2: Int;
    s2: String;

    init() {
        self.a = null;
        self.i2 = 999;
        self.s2 = "xyz";
    }
}