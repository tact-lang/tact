struct SimpleNested {
    inner: Int;
    skipped: String;
}

contract AssignSkip {
    s: SimpleNested;

    init() {
        self.s = SimpleNested{
            inner: 1,
            skipped: "skip"
        };
    }
}