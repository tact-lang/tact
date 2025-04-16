struct Small1 { f: Int; }
struct Small2 { f: Small1; }
struct Small3 { f: Small2; }
struct Small4 { f: Small3; }
struct Small5 { f: Small4; }

contract DeepNest5 {
    val: Small5;
    init() {
        self.val = Small5{
            f: Small4{
                f: Small3{
                    f: Small2{
                        f: Small1{ f: 321 }
                    }
                }
            }
        };
    }
}