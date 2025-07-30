struct InnerMost {
    s: String?;
    b: Bool?;
    i: Int?;
}

struct Mid {
    im: InnerMost?;
    note: String?;
    flag: Bool?;
}

struct TopLevel {
    m: Mid?;
    text: String?;
    number: Int?;
}

contract ComplexOptionalTop {
    state: TopLevel?;

    init() {
        self.state = TopLevel{
            m: Mid{im: null, note: null, flag: null},
            text: null,
            number: null
        };
    }
}