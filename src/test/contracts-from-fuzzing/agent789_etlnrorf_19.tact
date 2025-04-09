struct Flat {
    x: Int;
    y: Bool;
    z: String;
}

contract FlatFields {
    f1: Int;
    f2: Bool;
    f3: String;
    s: Flat;
    init() {
        self.f1 = 5;
        self.f2 = false;
        self.f3 = "flat";
        self.s = Flat{ x: 1, y: true, z: "x" };
    }
}