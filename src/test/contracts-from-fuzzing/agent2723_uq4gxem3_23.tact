struct Outer {
    x: Int;
    y: Bool;
}

contract UninitVal {
    outer: Outer;
    init() {
        self.outer = Outer{ x: 5, y: true };
    }
}