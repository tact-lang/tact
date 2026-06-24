struct One {
    x: Int;
}

struct Two {
    y: Bool;
}

contract TwoNestedStructs {
    first: One;
    second: Two;

    init() {
        self.first = One { x:123 };
        self.second = Two{ y:true };
    }
}
