struct Mid {
    a: Int;
    b: Int;
}

struct Large {
    f1: Int;
    f2: Bool;
    f3: Mid;
    f4: String?;
    f5: Cell;
    f6: Address?;
}

contract MultiType {
    st: Large;

    init() {
        self.st = Large{
            f1: 99,
            f2: false,
            f3: Mid{ a: 1, b: 2 },
            f4: "Hi",
            f5: emptyCell(),
            f6: null
        };
    }

    receive() {}
}