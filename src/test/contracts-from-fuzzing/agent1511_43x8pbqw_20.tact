struct StringIntBundle {
    s: String;
    n: Int;
}

contract BundleArray {
    b1: StringIntBundle;
    b2: StringIntBundle;
    b3: StringIntBundle;

    init() {
        self.b1 = StringIntBundle{ s:"x", n:1 };
        self.b2 = StringIntBundle{ s:"y", n:2 };
        self.b3 = StringIntBundle{ s:"z", n:3 };
    }
}