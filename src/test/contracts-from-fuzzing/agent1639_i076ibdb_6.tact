struct L4 {
    z: Int?;
}

struct L3 {
    y: L4?;
}

struct L2 {
    x: L3;
}

struct L1 {
    w: L2?;
}

contract TestContract {
    deep: L1;

    init() {
        self.deep = L1{
            w: L2{
                x: L3{
                    y: L4{
                        z: null
                    }
                }
            }
        };
    }
}