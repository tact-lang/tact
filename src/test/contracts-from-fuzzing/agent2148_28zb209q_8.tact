struct Wrap1 { val: Int; }
struct Wrap2 { w1: Wrap1; }
struct Wrap3 { w2: Wrap2; }
struct Wrap4 { w3: Wrap3; }
struct Wrap5 { w4: Wrap4; }

contract DeepChain {
    data: Wrap5;

    init() {
        self.data = Wrap5{
            w4: Wrap4{
                w3: Wrap3{
                    w2: Wrap2{
                        w1: Wrap1{ val: 99 }
                    }
                }
            }
        };
    }
}