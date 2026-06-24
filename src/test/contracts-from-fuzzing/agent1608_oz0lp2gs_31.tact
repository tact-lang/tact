struct L5 {
    v: Int?;
}

struct L4 {
    inner: L5;
}

struct L3 {
    inner: L4;
}

struct L2 {
    inner: L3;
}

struct L1 {
    inner: L2;
}

contract DeepFixedOptLeaf {
    root: L1;

    init() {
        self.root = L1{
            inner: L2{
                inner: L3{
                    inner: L4{
                        inner: L5{ v: null }
                    }
                }
            }
        };
    }
}