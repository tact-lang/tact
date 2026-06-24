contract InitDefault {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
    o1: Int?;
    o2: Bool?;

    init() {
        self.o1 = null;
        self.o2 = null;
    }
}
