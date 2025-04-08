struct DeepBig {
    i1: Int as uint8;
    i2: Int as int8;
    i3: Int as uint16;
    b: Bool;
    s: String;
    c: Cell;
}

contract DeepBigStorage {
    field: DeepBig;

    init() {
        self.field = DeepBig{ i1:1, i2:-2, i3:1024, b:true, s:"x", c:emptyCell() };
    }
}