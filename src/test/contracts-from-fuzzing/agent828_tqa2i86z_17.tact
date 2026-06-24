struct Info {
    x: Int;
    y: Int;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: Info;

    init() {
        self.a = 10;
        self.b = false;
        self.c = Info{ x: 5, y: 6 };
    }
}