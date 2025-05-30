// Same test as above but avoid default exprs not compile-time evaluable
struct LargeStruct {
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
    f13: String = "s";
    f14: String = "t";
    f15: Address; // no default
    f16: Address; // no default
}

contract LargeHolder {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            f15: myAddress(),
            f16: myAddress(),
        };
    }
}