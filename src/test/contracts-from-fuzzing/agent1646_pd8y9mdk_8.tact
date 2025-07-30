struct X {
    p: Int;
    q: Int;
    r: Bool;
}

contract DefaultsOverwritten {
    data: X = X { p: 0, q: 1, r: true };
    init() {
        self.data = X { p: 9, q: 8, r: false };
    }
}