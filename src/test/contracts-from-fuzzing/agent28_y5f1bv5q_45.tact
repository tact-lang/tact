struct SDefault {
    flag: Bool = false;
    count: Int as uint8 = 0;
    code: Cell;
}

contract Test {
    data: SDefault;

    init() {
        self.data = SDefault{
            code: emptyCell()
        };
    }
}