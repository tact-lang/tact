struct S {
    f1: Int?;
    f2: String?;
    f3: Bool?;
}

contract Optionals {
    v: S;

    init() {
        self.v = S{
            f1: null,
            f2: null,
            f3: null
        };
    }
}