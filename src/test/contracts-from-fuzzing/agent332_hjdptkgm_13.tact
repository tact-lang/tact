struct L1 {
    x: Int;
    l2: L2;
}

struct L2 {
    y: Int;
    l3: L3;
}

struct L3 {
    z: Int;
}

contract TestContract {
    storage: L1;

    init() {
        self.storage = L1{
            x:1,
            l2: L2{
                y:2,
                l3: L3{
                    z:3
                }
            }
        };
    }
}