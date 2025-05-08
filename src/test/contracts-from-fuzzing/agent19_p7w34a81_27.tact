struct Top {
    s: String;
    b: Bool?;
    i: Int;
}

contract MixedTopLevel {
    top1: Top;
    top2: Top;

    init() {
        self.top1 = Top{ s: "one", b: null, i: 1 };
        self.top2 = Top{ s: "two", b: true, i: 2 };
    }
}