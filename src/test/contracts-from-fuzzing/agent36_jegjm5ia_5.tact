contract MixedDefaultsAndInit {
    foo: Int = 1;
    bar: Bool = true;
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    cellField: Cell;
    sl: Slice;
    builder: Builder;
    s: String = "hey";

    init() {
        self.cellField = emptyCell();
        self.sl = emptyCell().asSlice();
        self.builder = beginCell();
    }
}