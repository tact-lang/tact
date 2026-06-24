contract DefaultValsPersist {
    x: Int = 1;
    y: Bool = true;
    z: String = "a";
    o: Int? = null;
    s: String? = null;

    init() {
        self.x = 2;
        self.y = false;
        self.z = "b";
        self.o = 3;
        self.s = "c";
    }
}