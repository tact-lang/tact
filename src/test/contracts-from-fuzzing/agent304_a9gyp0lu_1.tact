struct TwoFields {
    a: Int;
    b: Bool;
}

contract ManyFields {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Slice;
    f4: Cell;
    f5: Builder;
    f6: Address;
    f7: TwoFields;
    f8: Int?;
    init() {
        self.f0 = 1;
        self.f1 = true;
        self.f2 = "ok";
        self.f3 = emptyCell().asSlice();
        self.f4 = emptyCell();
        self.f5 = beginCell();
        self.f6 = myAddress();
        self.f7 = TwoFields{ a: 2, b: false };
        self.f8 = null;
    }
}
