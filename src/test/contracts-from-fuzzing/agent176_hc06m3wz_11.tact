struct Combo {
    intf: Int;
    boolf: Bool;
    strf: String;
    cellf: Cell;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ManyTypes {
    val: Combo;

    init() {
        self.val = Combo{
            intf: 42,
            boolf: true,
            strf: "hello",
            cellf: emptyCell(),
            optInt: 99,
            optBool: null,
            optStr: "there"
        };
    }
}