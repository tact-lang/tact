struct LargeStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "A";
    d: Int = 2;
    e: Bool = false;
    f: String = "B";
    g: Int = 3;
    h: Bool = true;
    i: String = "C";
    j: Int = 4;
    k: Bool = false;
    l: String = "D";
    m: Int = 5;
    n: Bool = true;
    o: String = "E";
}

contract LargeStructPersist {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{};
    }
}