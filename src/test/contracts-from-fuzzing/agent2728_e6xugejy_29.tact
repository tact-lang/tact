struct X {
    s: String;
    f: Bool;
}

contract Test {
    x1: X;
    x2: X;
    x3: X;

    init() {
        let temp = X{s: "tmp", f: false};
        self.x1 = temp;
        self.x2 = temp;
        self.x3 = temp;
    }
}
