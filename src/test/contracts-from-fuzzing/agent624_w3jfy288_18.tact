struct L6 {
    val: Int;
}

struct L5 {
    level: L6;
}

struct L4 {
    level: L5;
}

struct L3 {
    level: L4;
}

struct L2 {
    level: L3;
}

struct L1 {
    level: L2;
}

contract Deep6Nested {
    root: L1;

    init() {
        self.root = L1{
            level: L2{
                level: L3{
                    level: L4{
                        level: L5{
                            level: L6{
                                val: 123
                            }
                        }
                    }
                }
            }
        };
    }
}