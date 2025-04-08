struct Compact {
    flag: Bool;
    count: Int as uint8;
    code: Cell;
}

contract Test {
    data: Compact;

    init() {
        self.data = Compact{
            flag: true,
            count: 255,
            code: emptyCell()
        };
    }
}