struct Trio {
    x: Int;
    y: Bool;
    z: String;
}

contract MultiStructFields {
    s1: Trio;
    s2: Trio;

    init() {
        self.s1 = Trio{ x: 1, y: true, z: "one" };
        self.s2 = Trio{ x: 2, y: false, z: "two" };
    }

    receive() {
        self.s1.x += 1;
        self.s2.x += 1;
    }
}