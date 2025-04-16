struct Stuff {
    magic: Int;
}

contract OptStructSet {
    s: Stuff?;
    init() {
        self.s = Stuff{ magic: 999 };
    }
    receive() {}
}
