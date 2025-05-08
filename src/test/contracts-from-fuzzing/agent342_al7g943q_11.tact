struct BigNest1 { a: Int; }
struct BigNest2 { s: BigNest1; }
struct BigNest3 { s: BigNest2; }
struct BigNest4 { s: BigNest3; }
struct BigNest5 { s: BigNest4; }
struct BigNest6 { s: BigNest5; }

contract DeepDepthContract {
    fld: BigNest6;

    init() {
        self.fld = BigNest6{
            s: BigNest5{
                s: BigNest4{
                    s: BigNest3{
                        s: BigNest2{
                            s: BigNest1{ a: 42 }
                        }
                    }
                }
            }
        };
    }
}
