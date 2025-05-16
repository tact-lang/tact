contract TestContract {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    int4: Int = 4;
    int5: Int = 5;
    int6: Int = 6;
    int7: Int = 7;
    int8: Int = 8;
    int9: Int = 9;
    int10: Int = 10;
    int11: Int = 11;
    int12: Int = 12;
    int13: Int = 13;
    int14: Int = 14;
    int15: Int = 15;

    init() {
        self.int15 = 15;
    }

    receive() {
        let _ = self.int15;
    }
}