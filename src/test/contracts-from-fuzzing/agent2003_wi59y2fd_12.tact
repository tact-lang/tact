struct BigNested {
    inner1: Inner;
    inner2: Inner;
    text: String;
    flag: Bool;
}

struct Inner {
    val1: Int;
    val2: Int;
    note: String;
}

contract TestContract {
    big1: BigNested;
    big2: BigNested;

    init() {
        self.big1 = BigNested{
            inner1: Inner{ val1: 1, val2: 2, note: "a" },
            inner2: Inner{ val1: 3, val2: 4, note: "b" },
            text: "hello",
            flag: true,
        };
        self.big2 = BigNested{
            inner1: Inner{ val1: 5, val2: 6, note: "c" },
            inner2: Inner{ val1: 7, val2: 8, note: "d" },
            text: "world",
            flag: false,
        };
    }
}
