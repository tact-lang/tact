struct BigDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Int = 5;
    g: Int = 6;
    h: Int = 7;
    i: Int = 8;
    j: Int = 9;
    k: Int = 10;
    l: Int = 11;
    m: Int = 12;
    n: Int = 13;
    o: Int = 14;
    p: Int = 15;
}

contract TestContract {
    val: BigDefaults;
    init() {
        self.val = BigDefaults{};
    }
}