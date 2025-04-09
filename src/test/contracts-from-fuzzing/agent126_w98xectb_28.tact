struct Leaf { v: Int; }

struct L1 { ch: Leaf; }
struct L2 { ch: L1; }
struct L3 { ch: L2; }
struct L4 { ch: L3; }
struct L5 { ch: L4; }

contract DeepChain {
    top: L5;

    init() {
        self.top = L5{
            ch: L4{
                ch: L3{
                    ch: L2{
                        ch: L1{
                            ch: Leaf{ v:42 }
                        }
                    }
                }
            }
        };
    }
}