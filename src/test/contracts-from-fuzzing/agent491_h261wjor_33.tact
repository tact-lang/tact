contract MixDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: String = "hello";
    e: Cell;
    init() {
        self.c = myAddress();
        self.e = emptyCell();
    }
}