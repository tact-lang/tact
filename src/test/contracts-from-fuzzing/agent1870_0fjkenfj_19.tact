struct X {
    y: Y?;
}

struct Y {
    value: Int;
}

contract OptionalInner {
    data: X;

    init() {
        self.data = X {
            y: null
        };
    }
}
