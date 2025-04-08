struct Inner {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
}

contract ManyVars {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: String?;
    f5: Cell;
    f6: Slice;
    f7: Address;
    f8: Inner;

    init() {
        self.f1 = 42;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = null;
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = myAddress();
        self.f8 = Inner{a:1, b:false, c:null, d: myAddress()};
    }
}
