struct S {
    x: Int as uint8;
    y: Int as uint8;
}

contract TestContract {
    a: S; b: S; c: S; d: S;

    init() {
        self.a = S{x: 1, y: 2};
        self.b = S{x: 3, y: 4};
        self.c = S{x: 5, y: 6};
        self.d = S{x: 7, y: 8};
    }
}