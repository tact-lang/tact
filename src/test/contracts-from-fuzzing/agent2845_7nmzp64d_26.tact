struct S {
    a: Int = 1;
    b: Int?;
}

contract InitStructPartial {
    s: S;

    init() {
        self.s = S{
            b: null
        };
    }
}