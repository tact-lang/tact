struct Custom {
    a: Int;
    b: Bool?;
    c: String;
}

contract ManyOptionals {
    x: Int?;
    y: String?;
    z: Cell?;
    addr: Address?;
    nested: Custom?;

    init() {
        self.x = null;
        self.y = "hi";
        self.z = emptyCell();
        self.addr = null;
        self.nested = null;
    }
}