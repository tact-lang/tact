struct L3 {
    q: Int?;
}

struct L2 {
    r: L3?;
}

struct L1 {
    s: L2?;
}

contract DeepNulls {
    deep: L1;

    init() {
        self.deep = L1{
            s: L2{
                r: null,
            },
        };
    }

    receive() {}
}