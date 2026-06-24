// Deep nested with optional at deepest level
struct Alpha {
    val: Beta;
}

struct Beta {
    val: Gamma;
}

struct Gamma {
    val: Delta?;
}

struct Delta {
    x: Int?;
    y: Bool?;
}

contract DeepChain {
    root: Alpha;
    init() {
        self.root = Alpha{
            val: Beta{
                val: Gamma{
                    val: null
                }
            }
        };
    }
    receive() {}
}