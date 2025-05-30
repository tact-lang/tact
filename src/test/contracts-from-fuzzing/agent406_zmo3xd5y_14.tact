struct OuterC {
    inn: InnerC;
}

struct InnerC {
    t: Int?;
    s: String;
    b: Bool?;
}

contract WithDefaults {
    f1: Int = 7;
    f2: Bool = false;
    f3: OuterC;

    init() {
        self.f3 = OuterC{
            inn: InnerC{
                t: null,
                s: "in",
                b: true
            }
        };
    }
}