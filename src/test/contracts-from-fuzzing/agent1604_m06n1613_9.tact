contract ManyFields {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int = 3;
    f4: Int = 4;
    f5: Int = 5;
    f6: Int = 6;
    f7: Int = 7;
    f8: Int = 8;
    f9: Int = 9;
    f10: Int = 10;
    f11: Bool = true;
    f12: Bool = false;
    f13: Address? = null;
    f14: Cell;
    f15: Slice;
    f16: String = "hi";

    init() {
        self.f14 = emptyCell();
        self.f15 = emptyCell().asSlice();
    }

    receive() {}
}