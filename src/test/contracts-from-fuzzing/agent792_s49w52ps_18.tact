struct SOpt {
    s1: Int?;
    s2: Bool?;
}

struct SMix {
    sopt: SOpt?;
    sval: Int;
    sflag: Bool;
}

contract NestedOpts {
    data: SMix;

    init() {
        self.data = SMix{
            sopt: null,
            sval: 123,
            sflag: true
        };
    }
}