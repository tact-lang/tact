struct Rec1 { a: Int; }
struct Rec2 { a: Int; b: Rec1; }
struct Rec3 { a: Int; b: Rec2; }
struct Rec4 { a: Int; b: Rec3; }

contract DeepChainStore {
    rec: Rec4;

    init() {
        self.rec = Rec4{
            a:1,
            b: Rec3{
                a:2,
                b: Rec2{
                    a:3,
                    b: Rec1{
                        a:4
                    }
                }
            }
        };
    }
}