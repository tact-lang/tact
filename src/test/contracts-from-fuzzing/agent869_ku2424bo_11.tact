struct BigNested {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
    inner5: Int;
    inner6: Int;
    inner7: Int;
    inner8: Int;
    inner9: Int;
    inner10: Int;
}

contract LotsInner {
    state: BigNested;

    init() {
        self.state = BigNested{
            inner1: 1,
            inner2: 2,
            inner3: 3,
            inner4: 4,
            inner5: 5,
            inner6: 6,
            inner7: 7,
            inner8: 8,
            inner9: 9,
            inner10: 10,
        };
    }

    receive() {}
}
