struct S {
    a: Int;
    b: Bool;
}

contract Arranged {
    var1: Int;
    var2: S;
    var3: Bool;

    init() {
        self.var1 = 10;
        self.var2 = S{ a:1, b:false };
        self.var3 = true;
    }
}