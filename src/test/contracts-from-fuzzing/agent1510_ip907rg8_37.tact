struct S {
    a: Int?;
    b: Int;
    c: Int?;
}

contract OptionalBetween {
    s: S;

    init() {
        self.s = S{a:null, b:5, c:null};
    }
}