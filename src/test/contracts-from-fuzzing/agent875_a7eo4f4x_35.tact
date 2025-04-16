struct NestedMixOptional {
    a: Int?;
    b: InnerOpt?;
}

struct InnerOpt {
    c: String;
    d: Int?;
}

contract NestedMixOptionalTest {
    n: NestedMixOptional;
    init() {
        self.n = NestedMixOptional{
            a:null,
            b:InnerOpt{
                c:"hi",
                d:null
            }
        };
    }
}