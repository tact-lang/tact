struct Inner {
    x: Int;
    y: Int?;
    flag: Bool;
}

contract TestContract {
    a: Int;
    s: Inner;
    b: Int;

    init() {
        self.a = 1;
        self.s = Inner{ x:2, y:null, flag:true };
        self.b = 3;
    }
}
