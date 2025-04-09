struct Combo {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    o1: Int?;
    o2: Bool?;
}

contract ManyFieldTypes {
    comboField: Combo;
    init() {
        self.comboField = Combo{
            i: 10,
            b: false,
            s: "hey",
            c: emptyCell(),
            o1: null,
            o2: true
        };
    }
}