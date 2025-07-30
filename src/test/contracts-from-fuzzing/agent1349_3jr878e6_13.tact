struct Middle {
    i: Int;
    b: Bool;
    s: String;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract NestedStructs {
    t: Top = Top{
        m1: Middle{ i: 1, b: true, s:"a" },
        m2: Middle{ i: 2, b: false, s:"b" }
    };

    receive() {
        self.t = self.t;
    }
}