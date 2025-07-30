struct Mid {
    i: Int;
    s: String;
}

contract MixedFlattened {
    a: Int;
    m: Mid;
    b: Bool;

    init() {
        self.a = 1;
        self.m = Mid{ i: 10, s: "ten" };
        self.b = false;
    }
}
