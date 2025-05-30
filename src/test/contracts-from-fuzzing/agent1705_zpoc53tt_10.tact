struct OptionNested {
    foo: Int?;
    bar: InnerOpt;
}

struct InnerOpt {
    x: Bool?;
    y: InnerMostOpt;
}

struct InnerMostOpt {
    z: String?;
}

contract OptNestTest {
    st: OptionNested;

    init() {
        self.st = OptionNested{
            foo: null,
            bar: InnerOpt{
                x: null,
                y: InnerMostOpt{ z: null },
            },
        };
    }
}