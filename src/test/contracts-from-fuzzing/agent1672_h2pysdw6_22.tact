struct BigNest1 { x: Int; }
struct BigNest2 { x: BigNest1; }
struct BigNest3 { x: BigNest2; }
struct BigNest4 { x: BigNest3; }
struct BigNest5 { x: BigNest4; }
struct BigNest6 { x: BigNest5; }
struct BigNest7 { x: BigNest6; }

contract MegaNested {
    f: BigNest7;

    init() {
        self.f = BigNest7{
            x: BigNest6{
                x: BigNest5{
                    x: BigNest4{
                        x: BigNest3{
                            x: BigNest2{
                                x: BigNest1{ x: 123 }
                            }
                        }
                    }
                }
            }
        };
    }
}
