contract ManyTypes {
    x: Int;
    y: Bool;
    z: String;
    s: Slice;
    c: Cell;
    a: Address;

    init() {
        self.x = 1;
        self.y = true;
        self.z = "hi";
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.a = myAddress();
    }
}