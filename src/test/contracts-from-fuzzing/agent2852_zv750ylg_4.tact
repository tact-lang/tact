contract LongPrimitives {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = false;
    g: Bool = true;
    h: Bool = false;
    i: String = "";
    j: Address;
    k: Address;
    l: String = "test";

    init() {
        self.j = myAddress();
        self.k = myAddress();
    }
}