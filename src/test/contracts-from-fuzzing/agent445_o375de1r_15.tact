// Deep chain combining optionals and defaults
struct Leaf {
    z: Int?;
}

struct Mid {
    y: Leaf;
}

struct Top {
    x: Mid;
}

contract OptDefaultChain {
    state: Top = Top{
        x: Mid{
            y: Leaf{
                z: null
            }
        }
    };
}
