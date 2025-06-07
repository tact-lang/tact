contract TestStorage {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "x";
    f: String? = null;
    g: Address;
    h: Address?;
    i: Int = 3;
    j: Int? = null;

    init() {
        self.g = myAddress();
        self.h = null;
    }

    receive() {
        let _ = self.a + self.i;
    }
}