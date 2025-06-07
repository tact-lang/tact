struct MiddleA {
    x: Int;
    y: Bool;
}

struct MiddleB {
    z: String;
    w: Address;
}

struct Top {
    a: MiddleA;
    b: MiddleB;
}

contract MultiNested {
    top: Top;

    init() {
        self.top = Top{
            a: MiddleA{ x: 5, y: true },
            b: MiddleB{ z: "hi", w: myAddress() }
        };
    }
}