struct Rec1 { v: Int; }
struct Rec2 { sub: Rec1; }
struct Rec3 { sub: Rec2; }
struct Rec4 { sub: Rec3; }

contract DeepNestChain {
    chain: Rec4;

    init() {
        self.chain = Rec4{
            sub: Rec3{
                sub: Rec2{
                    sub: Rec1{ v: 42 }
                }
            }
        };
    }
}
