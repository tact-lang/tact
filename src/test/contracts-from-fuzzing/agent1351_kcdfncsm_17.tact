struct StrNest1 { s: String }
struct StrNest2 { n: StrNest1 }
struct StrNest3 { n: StrNest2 }

contract StringDeep {
    strval: StrNest3;

    init() {
        self.strval = StrNest3{
            n: StrNest2{
                n: StrNest1{ s:"test" }
            }
        };
    }
}