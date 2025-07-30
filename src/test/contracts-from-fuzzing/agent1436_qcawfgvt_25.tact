// Large nested struct tree with deep optional node
struct L3 {
    leaf: Int?;
}

struct L2 {
    mid: L3;
}

struct L1 {
    root: L2;
}

contract TestContract {
    data: L1;

    init() {
        self.data = L1{
            root: L2{
                mid: L3{
                    leaf: null
                }
            }
        };
    }
}
