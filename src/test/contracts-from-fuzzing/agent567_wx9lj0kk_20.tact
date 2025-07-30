// chain optional inside optional: optional struct contains optional struct contains optional struct
struct Leaf {
    x: Int = 5;
}

struct Mid {
    leaf: Leaf?;
}

struct Up {
    mid: Mid?;
}

contract ChainOpt {
    up: Up?;
    init() {
        self.up = Up {
            mid: Mid {
                leaf: Leaf {x:999}
            }
        };
    }
}
