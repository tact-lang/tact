struct Inner1 {
    n: Int as uint8;
}

struct Inner2 {
    flag: Bool;
}

struct Both {
    first: Inner1;
    second: Inner2;
}

contract Test {
    data: Both;

    init() {
        self.data = Both{
            first: Inner1{ n: 255 },
            second: Inner2{ flag: true },
        };
    }
}