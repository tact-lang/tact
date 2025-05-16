struct S {
    a: Int? = 1;
    b: Bool? = true;
}

contract Test22 {
    data: S;

    init() {
        self.data = S{
            a: null,
            b: null,
        };
    }
}