struct L3 {
    v: Int? = null;
}

struct L2 {
    inner: L3? = null;
}

struct L1 {
    inner: L2?;
}

contract DeepMix {
    f: L1;

    init() {
        self.f = L1{
            inner: L2{
                inner: null
            }
        };
    }
}
