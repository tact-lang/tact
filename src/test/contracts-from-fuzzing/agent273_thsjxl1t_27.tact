struct S1 {
    a: Int?;
    b: Bool? = true;
}

struct Wrap {
    inner: S1?;
}

contract Test27 {
    w: Wrap;

    init() {
        self.w = Wrap{ inner: null };
    }
}