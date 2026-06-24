struct S1 { a: Int; }
struct S2 { b: Int; }

contract ManyFieldsContract {
    f1: Int = 1;
    f2: Bool = true;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    s1: S1;
    s2: S2;

    init() {
        self.f3 = myAddress();
        self.f4 = "hello";
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.s1 = S1{a:11};
        self.s2 = S2{b:22};
    }
}