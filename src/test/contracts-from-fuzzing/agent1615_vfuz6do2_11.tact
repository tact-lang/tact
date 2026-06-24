struct Deep {
    x: Int?;
    y: Bool = false;
    z: String?;
}

struct Mid {
    a: Deep?;
    b: Int;
}

contract TestContract {
    value: Mid;

    init() {
        self.value = Mid {
            a: null,
            b: 99
        };
    }

    receive() {}
}