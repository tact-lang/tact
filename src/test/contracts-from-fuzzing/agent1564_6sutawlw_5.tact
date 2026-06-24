struct Sibling1 {
    v1: Int;
}

struct Sibling2 {
    v2: String;
}

contract SiblingStructs {
    s1: Sibling1;
    s2: Sibling2;

    init() {
        self.s1 = Sibling1{ v1: 10 };
        self.s2 = Sibling2{ v2: "x" };
    }
}