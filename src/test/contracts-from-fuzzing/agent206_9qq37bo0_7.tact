struct Options {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    cellOpt: Cell?;
}

contract OptStructTest {
    data: Options;

    init() {
        self.data = Options{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            strOpt: null,
            cellOpt: emptyCell()
        };
    }
}
