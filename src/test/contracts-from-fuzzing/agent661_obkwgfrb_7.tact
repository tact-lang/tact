struct Inner {
    val1: Int;
    val2: Bool;
}

contract MultipleFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Inner;
    f5: Bool?;
    f6: String;
    f7: Int?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "abc";
        self.f4 = Inner{ val1: 2, val2: true };
        self.f5 = null;
        self.f6 = "def";
        self.f7 = null;
    }
}