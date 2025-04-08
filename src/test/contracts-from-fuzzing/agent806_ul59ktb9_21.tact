struct BigNest1 { a: Int; }
struct BigNest2 { a: BigNest1; }
struct BigNest3 { a: BigNest2; }
struct BigNest4 { a: BigNest3; }

contract LargerDepth {
    val: BigNest4;

    init() {
        self.val = BigNest4{
            a: BigNest3{
                a: BigNest2{
                    a: BigNest1{
                        a: 55
                    }
                }
            }
        };
    }
}