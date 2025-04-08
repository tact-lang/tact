struct OptRich {
    intOpt: Int?;
    strOpt: String?;
    boolOpt: Bool?;
}

contract OptRichTest {
    rec: OptRich;

    init() {
        self.rec = OptRich{
            intOpt: null,
            strOpt: null,
            boolOpt: null,
        };
    }
}