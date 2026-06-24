struct Child {
    flag: Bool;
    text: String;
}

contract ArrayLikeFields {
    f1: Child;
    f2: Child;
    f3: Child;
    f4: Child;

    init() {
        self.f1 = Child{ flag: true, text: "a" };
        self.f2 = Child{ flag: false, text: "b" };
        self.f3 = Child{ flag: true, text: "c" };
        self.f4 = Child{ flag: false, text: "d" };
    }
}
