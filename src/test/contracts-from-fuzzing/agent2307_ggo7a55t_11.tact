struct OptionalStr {
    name: String?;
    num: Int;
}

struct Wrap {
    opt: OptionalStr?;
}

contract OptionalInOptional {
    oio: Wrap;

    init() {
        self.oio = Wrap{
            opt: OptionalStr{
                name: null,
                num: 42
            }
        };
    }
}
