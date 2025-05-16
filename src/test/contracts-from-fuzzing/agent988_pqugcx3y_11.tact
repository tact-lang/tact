contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    o1: Int?;
    o2: String?;
    o3: Bool?;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "hi";
        self.o1 = null;
        self.o2 = "x";
        self.o3 = true;
    }
}