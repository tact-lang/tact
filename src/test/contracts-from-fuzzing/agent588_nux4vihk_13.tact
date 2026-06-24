contract Wide {
    a: Int = 1;
    b: Int;
    c: Int?;
    d: Bool = false;
    e: Bool;
    f: Bool?;
    g: String = "";
    h: String;
    i: String?;
    j: Cell;
    k: Slice;
    l: Slice?;
    m: Address;
    n: Address?;
    o: Int = 42;

    init() {
        self.b = 2;
        self.e = true;
        self.h = "h";
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
        self.m = myAddress();
    }

    receive() {
        let _ = self.a + self.b;
    }
}