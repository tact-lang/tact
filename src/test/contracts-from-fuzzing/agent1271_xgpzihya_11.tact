struct Leaf {
    a: Int as int64;
    b: Int as uint8;
}

struct Container {
    x: Int as uint16;
    y: Bool;
    suffix: Slice as remaining;
}

struct Top {
    leaf: Leaf;
    cont: Container;
}

contract SerAnnTest {
    data: Top;
    init() {
        self.data = Top{
            leaf: Leaf{ a: -12345, b: 255 },
            cont: Container{ x: 500, y: true, suffix: emptyCell().asSlice() }
        };
    }
    receive() {}
}