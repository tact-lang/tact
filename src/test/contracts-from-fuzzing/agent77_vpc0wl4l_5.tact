contract ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    q: Address?;
    p: Cell?;
    s: Slice?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.q = null;
        self.p = null;
        self.s = null;
    }

    receive() {
        self.x = 1;
        self.y = true;
        self.z = "abc";
        self.q = myAddress();
        self.p = emptyCell();
        self.s = emptyCell().asSlice();
    }
}
