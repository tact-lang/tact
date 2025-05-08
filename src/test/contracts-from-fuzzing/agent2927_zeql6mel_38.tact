// Large chain of several nested structs with deep optional in the last
struct Last {
    z: Int?;
}

struct Fourth {
    l: Last;
}

struct Third {
    f: Fourth;
}

struct Second {
    t: Third;
}

struct First {
    s: Second;
}

contract DeepChainOptionally {
    root: First;

    init() {
        self.root = First{
            s: Second{
                t: Third{
                    f: Fourth{
                        l: Last{ z:null }
                    }
                }
            }
        };
    }
}