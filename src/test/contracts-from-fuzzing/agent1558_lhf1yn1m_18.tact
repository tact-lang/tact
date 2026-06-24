struct Tiny {
    x: Int;
}

struct Mini {
    val: Tiny;
}

struct Small {
    m: Mini;
}

struct Medium {
    s: Small;
}

struct Big {
    m: Medium;
}

contract DeepChain {
    b: Big;
    
    init() {
        self.b = Big{
            m: Medium{
                s: Small{
                    m: Mini{
                        val: Tiny{x:1}
                    }
                }
            }
        };
    }
}
