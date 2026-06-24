struct Small {
    x: Int;
    y: Int;
}

contract TinyNested {
    s1: Small;
    s2: Small;
    init() {
        self.s1 = Small{ x: 1, y: 2 };
        self.s2 = Small{ x: 3, y: 4 };
    }
}