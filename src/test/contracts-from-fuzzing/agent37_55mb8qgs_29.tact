struct Reordered {
    b: Int;
    a: Int;
}

contract SwapFields {
    s: Reordered;

    init() {
        self.s = Reordered{ b:5, a:10 };
    }
}
