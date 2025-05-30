struct S {
    a: Int?;
    b: Bool?;
    c: Int = 0;
    d: Bool = false;
    e: Int?;
    f: Bool = true;
}

contract TestContract {
    s_field: S;

    init() {
        self.s_field = S{ e: null };
    }
}