struct One {
    x: Int;
}

struct Two {
    y: Int;
}

struct Three {
    z: Int;
}

contract ManyStructsFlat {
    s1: One;
    s2: Two;
    s3: Three;

    init() {
        self.s1 = One{ x: 1 };
        self.s2 = Two{ y: 2 };
        self.s3 = Three{ z: 3 };
    }
}
