struct One {
    x: Int;
}

struct Two {
    y: Bool;
}

struct Three {
    z: String;
}

contract MultipleStructFields {
    first: One = One{ x: 1 };
    second: Two = Two{ y: true };
    third: Three = Three{ z: "abc" };

    init() {
        self.first = One{ x: 2 };
        self.second = Two{ y: false };
        self.third = Three{ z: "xyz" };
    }
}