struct MidOpt {
    i: Int;
    s: String?;
}

struct Outermost {
    inner: MidOpt?;
    flag: Bool;
}

contract OptionalMidStruct {
    st: Outermost;

    init() {
        self.st = Outermost {
            inner: MidOpt {
                i: 123,
                s: null
            },
            flag: true
        };
    }
}
