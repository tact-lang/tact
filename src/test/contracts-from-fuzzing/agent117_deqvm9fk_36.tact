// Very deep nested optional chain
struct L4 {
    deep: Int?;
}

struct L3 {
    nest: L4?;
}

struct L2 {
    nest: L3?;
}

struct L1 {
    nest: L2?;
}

contract VeryDeepOpts {
    root: L1?;

    init() {
        self.root = L1{
            nest: L2{
                nest: L3{
                    nest: L4{deep: 42}
                }
            }
        };
    }
}
