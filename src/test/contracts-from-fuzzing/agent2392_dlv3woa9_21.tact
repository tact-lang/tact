struct Initable {
    val: Int;
}

contract InitNested {
    x: Int;
    y: Initable;

    init() {
        self.x = 7;
        self.y = Initable{ val: 99 };
    }
}