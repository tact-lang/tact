struct S {
    f1: Int;
    f2: Int?;
    f3: Bool?;
    f4: String?;
}

contract Test {
    s: S?;

    init() {
        self.s = S{
            f1: 1,
            f2: 2,
            f3: true,
            f4: null
        };
    }
}