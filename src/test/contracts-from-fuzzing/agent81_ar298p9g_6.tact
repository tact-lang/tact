struct Three {
    a: Int;
    b: Bool;
    c: Int;
}

contract TestContract {
    x: Three;
    y: Three;
    z: Three;

    init() {
        self.x = Three{ a: 1, b: false, c: 2 };
        self.y = Three{ a: 3, b: true, c: 4 };
        self.z = Three{ a: 5, b: false, c: 6 };
    }
}