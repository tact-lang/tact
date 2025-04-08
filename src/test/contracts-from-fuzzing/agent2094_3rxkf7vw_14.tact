struct Stuff {
    magic: Int;
}

contract OptStruct {
    s: Stuff?;
    init() {
        self.s = null;
    }
    receive() {}
}
