struct OptionalInNested {
    inn: InnerOpt;
}

struct InnerOpt {
    a: Int?;
}

contract NestedOptField {
    dat: OptionalInNested;

    init() {
        self.dat = OptionalInNested{
            inn: InnerOpt{ a: null }
        };
    }
}