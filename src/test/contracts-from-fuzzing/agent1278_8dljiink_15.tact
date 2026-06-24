struct TailData {
    n: Int as uint16;
    rest: Slice as remaining;
}

contract TestContract {
    tail: TailData;

    init() {
        let s = emptyCell().asSlice();
        self.tail = TailData{
            n: 77,
            rest: s,
        };
    }
}