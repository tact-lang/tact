struct InnerOpt {
    val: Int?;
}

struct MidOpt {
    a: InnerOpt?;
    b: InnerOpt?;
}

struct OuterOpt {
    m: MidOpt?;
}

contract ComplexNullable {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            m: MidOpt{
                a: InnerOpt{ val: 1 },
                b: null
            }
        };
    }
}