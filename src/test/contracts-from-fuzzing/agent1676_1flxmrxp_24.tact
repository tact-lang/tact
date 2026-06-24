struct ManyNest1 {a: Int;}
struct ManyNest2 {a: ManyNest1;}
struct ManyNest3 {a: ManyNest2;}
struct ManyNest4 {a: ManyNest3;}

contract DeepChain {
    root: ManyNest4;
    init() {
        self.root = ManyNest4{
            a: ManyNest3{
                a: ManyNest2{
                    a: ManyNest1{a: 123}
                }
            }
        };
    }
}