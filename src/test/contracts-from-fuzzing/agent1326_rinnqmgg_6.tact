struct BigFlat {
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
    f11: Bool = false;
    f12: Bool = true;
    f13: String = "a";
    f14: String = "b";
    f15: Address;
}

contract LongFlatTest {
    big: BigFlat;

    init() {
        self.big = BigFlat{
            f1: 10, f2: 20, f3: 30, f4: 40, f5: 50, f6: 60, f7: 70, f8: 80, f9: 90, f10: 100,
            f11: true, f12: false, f13: "hello", f14: "world", f15: myAddress()
        };
    }

    receive() {
        let _ = self.big;
    }
}