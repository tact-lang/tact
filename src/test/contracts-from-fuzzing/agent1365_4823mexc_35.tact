struct Leaf {
    val: Int;
}

struct Mid1 {
    leaf: Leaf;
}

struct Mid2 {
    mid: Mid1;
}

struct Mid3 {
    inner: Mid2;
}

contract SmallDeepChain {
    r: Mid3;

    init() {
        self.r = Mid3{
            inner: Mid2{
                mid: Mid1{
                    leaf: Leaf{
                        val: 1,
                    },
                },
            },
        };
    }
}