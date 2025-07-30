struct BigNested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
    inner4: Slice;
    inner5: Cell;
}

contract MultiPersistent {
    one: BigNested;
    two: BigNested;
    three: BigNested;
    four: BigNested;

    init() {
        let sample = BigNested{
            inner1: 42,
            inner2: true,
            inner3: "hi",
            inner4: emptyCell().asSlice(),
            inner5: emptyCell(),
        };
        self.one = sample;
        self.two = sample;
        self.three = sample;
        self.four = sample;
    }
}