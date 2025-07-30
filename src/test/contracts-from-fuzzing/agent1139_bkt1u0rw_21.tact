struct S {
    a: Int?;
    b: Bool?;
}

contract DeepOptTree {
    nested1: S?;
    nested2: S;
    nested3: S?;
    nested4: S;

    init() {
        self.nested1 = null;
        self.nested2 = S{ a: 1, b: null };
        self.nested3 = S{ a: null, b: true };
        self.nested4 = S{ a: 5, b: false };
    }
}