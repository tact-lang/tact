struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Wrap {
    opt: MultiOptionals?;
}

contract MultiOptionalWrap {
    data: Wrap;

    init() {
        self.data = Wrap {
            opt: MultiOptionals {
                a: null,
                b: null,
                c: null,
                d: null
            }
        };
    }
}