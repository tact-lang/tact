struct Texts {
    s: String;
    ns: String?;
}

contract ManyStrings {
    t1: Texts;
    t2: Texts;

    init() {
        self.t1 = Texts{ s: "a", ns: null };
        self.t2 = Texts{ s: "b", ns: "c" };
    }
}