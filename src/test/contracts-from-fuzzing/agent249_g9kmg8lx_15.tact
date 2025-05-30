struct L1 {
    a: Int;
}
struct L2 {
    inner: L1;
}
struct L3 {
    nested: L2;
}
struct L4 {
    core: L3;
}

contract FourLayers {
    data: L4;

    init() {
        self.data = L4{
            core: L3{
                nested: L2{
                    inner: L1{
                        a: 123
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.data.core.nested.inner.a;
    }
}