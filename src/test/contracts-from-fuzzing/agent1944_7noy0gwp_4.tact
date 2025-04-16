struct Defaults {
    a: Int = 10;
    b: Bool?;
    c: String = "hello";
    d: Cell;
}

contract DefaultValsOptFields {
    data: Defaults;

    init() {
        self.data = Defaults{
            d: emptyCell(),
        };
    }
}