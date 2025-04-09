struct Compose {
    a: Int;
    b: Bool;
    c: String;
}

contract MixedOrder {
    s: Compose;
    i: Int;
    b: Bool;
    t: String;

    init() {
        self.s = Compose{ a: 1, b: false, c: "A" };
        self.i = 2;
        self.b = true;
        self.t = "B";
    }
}