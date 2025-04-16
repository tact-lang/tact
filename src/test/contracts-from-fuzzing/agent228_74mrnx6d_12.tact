struct SOpt {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract NestedInContract {
    x: Int = 1;
    s: SOpt;
    y: Int = 2;

    init() {
        self.x = 10;
        self.y = 20;
        self.s = SOpt{
            intOpt: 11,
            boolOpt: false,
            strOpt: "hi"
        };
    }
}