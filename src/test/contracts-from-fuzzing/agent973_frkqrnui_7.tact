struct BigNest1 { a: Int; }
struct BigNest2 { a: BigNest1; }
struct BigNest3 { a: BigNest2; }
struct BigNest4 { a: BigNest3; }
struct BigNest5 { a: BigNest4; }

contract DeepDeep {
    data: BigNest5;
    init() {
        self.data = BigNest5{
            a: BigNest4{
                a: BigNest3{
                    a: BigNest2{
                        a: BigNest1{ a: 999 },
                    }
                }
            }
        };
    }
}