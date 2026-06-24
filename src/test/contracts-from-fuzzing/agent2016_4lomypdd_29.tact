struct RecA {
    b: RecB?;
}

struct RecB {
    c: RecC?;
}

struct RecC {
    d: Int?;
}

contract Test {
    x: RecA?;
    init() {
        self.x = null;
    }
}