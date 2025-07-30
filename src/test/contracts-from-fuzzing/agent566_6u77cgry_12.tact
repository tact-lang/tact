struct One {
    x: Int;
}

struct Two {
    y: String;
}

contract MultiStructs {
    a: One;
    b: Two;

    init() {
        self.a = One{ x: 1 };
        self.b = Two{ y: "hi" };
    }
}