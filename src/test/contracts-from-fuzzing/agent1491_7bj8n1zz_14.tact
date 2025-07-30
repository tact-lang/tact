struct OnlyStringsBools {
    s1: String;
    s2: String;
    b1: Bool;
    b2: Bool;
}

contract TestContract {
    stuff: OnlyStringsBools;
    init() {
        self.stuff = OnlyStringsBools{
            s1: "a", s2: "b",
            b1: true, b2: false
        };
    }
}