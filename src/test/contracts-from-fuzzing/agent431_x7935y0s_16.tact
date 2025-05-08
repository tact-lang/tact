struct L3 {
    q: Int?;
}

struct L2 {
    r: L3?;
}

struct L1 {
    s: L2?;
}

contract DeepOptionals {
    deep: L1;

    init() {
        self.deep = L1{
            s: L2{
                r: L3{
                    q: 42,
                },
            },
        };
    }

    receive() {}
}