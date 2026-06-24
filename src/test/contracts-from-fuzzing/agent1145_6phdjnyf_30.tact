struct UnusualOrdering {
    c: Cell;
    b: Bool;
    s: String;
    ai: Int;
    si: Int as int8;
    big: Int as int257;
    opt1: Int?;
    opt2: String?;
}

contract OrderingTest {
    persistent: UnusualOrdering;

    init() {
        self.persistent = UnusualOrdering{
            c: emptyCell(),
            b: true,
            s: "string",
            ai: 5,
            si: -8,
            big: 1000,
            opt1: null,
            opt2: "hi"
        };
    }
}
