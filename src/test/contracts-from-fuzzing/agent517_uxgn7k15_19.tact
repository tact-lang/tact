struct WeirdOrder {
    s: String;
    a: Int;
    b: Bool;
    c: Cell;
    x: Int;
    y: String;
    z: Slice;
}

contract WeirdOrderContract {
    d: WeirdOrder;
    init() {
        self.d = WeirdOrder{
            s: "str", a: 1, b: true, c: emptyCell(), x: 9, y: "hi", z: emptyCell().asSlice()
        };
    }
}