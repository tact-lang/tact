struct A { x: Int }

contract ManyFieldContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: A;
    f7: Int?;
    f8: Bool?;
    f9: A?;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "abc";
        self.f4 = emptyCell().asSlice();
        self.f5 = myAddress();
        self.f6 = A{x:5};
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
    }
}