struct BigNest1 { x: Int }
struct BigNest2 { x: BigNest1 }
struct BigNest3 { x: BigNest2 }
struct BigNest4 { x: BigNest3 }
struct BigNest5 { x: BigNest4 }

contract FiveNestDeep {
    f: BigNest5;

    init() {
        self.f = BigNest5{
            x: BigNest4{
                x: BigNest3{
                    x: BigNest2{
                        x: BigNest1{ x: 1 }
                    }
                }
            }
        };
    }
}