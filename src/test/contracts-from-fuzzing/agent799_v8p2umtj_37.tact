// optional inside nested struct inside optionals
struct Innermost {
    v: Int?;
}

struct Middle {
    m: Innermost?;
}

contract NestedOptFields {
    f: Middle? = null;

    init() {
        self.f = Middle{ m: Innermost{ v: 10 } };
    }
}