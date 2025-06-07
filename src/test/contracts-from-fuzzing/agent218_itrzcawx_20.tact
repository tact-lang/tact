struct TailRemains {
    head: Int;
    tail: Cell as remaining;
}

contract StructRemainingCell {
    chunk: TailRemains;

    init() {
        self.chunk = TailRemains{
            head: 1,
            tail: emptyCell()
        };
    }
}