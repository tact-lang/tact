struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 55,
            b: null,
            c: "sss",
            d: emptyCell()
        };
    }
}