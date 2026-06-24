struct In1 {
    f: Int;
}

struct In2 {
    inner: In1;
}

struct In3 {
    wrap: In2;
}

struct In4 {
    seq: In3;
}

contract NestedDeepContract {
    q: In4;

    init() {
        self.q = In4{
            seq: In3{
                wrap: In2{
                    inner: In1{
                        f: 900
                    }
                }
            }
        };
    }
}