struct Suffix {
    prefix: Int as uint8;
    rest: Cell as remaining;
}

contract TailCell {
    suffix: Suffix;

    init() {
        self.suffix = Suffix{
            prefix: 7,
            rest: emptyCell(),
        };
    }
}