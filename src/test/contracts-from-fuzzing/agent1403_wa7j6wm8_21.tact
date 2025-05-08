struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: String;
}

struct Both {
    f1: Inner1;
    f2: Inner2;
}

contract MultiInner {
    data: Both;
    init() {
        self.data = Both{
            f1: Inner1{ a: 5 },
            f2: Inner2{ b: "xx" },
        };
    }
}