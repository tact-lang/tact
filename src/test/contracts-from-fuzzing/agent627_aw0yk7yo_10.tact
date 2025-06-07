struct Bottom {
    leaf1: Int?;
    leaf2: String?;
}

struct Mid {
    left: Bottom;
    right: Bottom;
}

struct Top {
    m1: Mid;
    m2: Mid;
    b: Bool;
}

contract TestContract {
    tree: Top;
    init() {
        self.tree = Top{
            m1: Mid{
                left: Bottom{leaf1:null, leaf2:null},
                right: Bottom{leaf1:1, leaf2:""}
            },
            m2: Mid{
                left: Bottom{leaf1:2, leaf2:null},
                right: Bottom{leaf1:null, leaf2:"text"}
            },
            b: false
        };
    }
}