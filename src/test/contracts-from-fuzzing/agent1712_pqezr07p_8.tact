struct LargeStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
    k: Int = 11;
    l: Int = 12;
    m: Int = 13;
    n: Int = 14;
    o: Int = 15;
}

contract TestContract {
    big: LargeStruct = LargeStruct{};

    init() {
        self.big = LargeStruct{ a: 123, b: 456, c: 789, d: 10, e: 11, f: 12, g: 13, h:14, i:15, j:16, k:17, l:18, m:19, n:20, o:21 };
    }

    receive() {
        let _ = self.big.m + 1;
    }
}