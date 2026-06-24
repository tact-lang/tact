struct One {
    n: Int;
}

struct Two {
    x: Int;
    y: Int;
}

contract MultiStructStore {
    a: One;
    b: Two;

    init() {
        self.a = One{ n: 10 };
        self.b = Two{ x: 1, y: 2 };
    }
}