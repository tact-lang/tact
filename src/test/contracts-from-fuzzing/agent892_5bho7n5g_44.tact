struct S {
    a: Int? = 1;
    b: Int?;
    c: Bool? = true;
    d: Bool?;
}

contract PartialInit {
    s: S;

    init() {
        self.s = S{ a:5, c:false };
    }
}