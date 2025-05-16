contract DefaultVals {
    x: Int = 10;
    y: Bool = true;
    z: String = "abc";
    o: Int? = null;
    p: Bool? = false;
    q: String? = null;

    init() {
        self.x = 11;
        self.y = false;
        self.z = "def";
        self.o = 5;
        self.p = true;
        self.q = "xyz";
    }
}