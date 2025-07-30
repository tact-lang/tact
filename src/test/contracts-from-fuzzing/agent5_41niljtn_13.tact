// Test very long nested struct chain as persistent var
struct Leaf { val: Int; }

struct Branch1 { l: Leaf; }
struct Branch2 { b1: Branch1; }
struct Branch3 { b2: Branch2; }
struct Branch4 { b3: Branch3; }
struct Branch5 { b4: Branch4; }

contract DeepChain {
    p: Branch5;

    init() {
        self.p = Branch5{
            b4: Branch4{
                b3: Branch3{
                    b2: Branch2{
                        b1: Branch1{
                            l: Leaf{val: 999}
                        }
                    }
                }
            }
        };
    }
}