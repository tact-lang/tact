struct Partial {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
}

contract Test27 {
    p: Partial;
    init() {
        self.p = Partial{ x: 7 };
    }
}