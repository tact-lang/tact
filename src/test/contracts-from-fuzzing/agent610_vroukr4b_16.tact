struct ManyOptionals {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
}

contract TestManyOptionals {
    mo: ManyOptionals;

    init() {
        self.mo = ManyOptionals{
            i1: null,
            i2: 2,
            b1: null,
            b2: true,
            s1: null,
            s2: "hi"
        };
    }
}