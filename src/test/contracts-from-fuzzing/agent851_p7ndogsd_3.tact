struct InnerMost {
    v: Int;
}

struct Middle {
    m1: Int?;
    m2: String;
    m3: InnerMost?;
}

contract OptionalDeep {
    data: Middle?;

    init() {
        self.data = Middle{
            m1: null,
            m2: "abc",
            m3: InnerMost{ v: 5 }
        };
    }
}