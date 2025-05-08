struct SDefault {
    x: Int = 7;
    y: Bool = true;
}

contract DefaultStructVar {
    s: SDefault;
    init() {
        self.s = SDefault{ x: 1, y: false };
    }
}