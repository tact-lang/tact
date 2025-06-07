struct L3 { z: Int; }
struct L2 { inner: L3; }
struct L1 { inner: L2; }

contract TestContract {
    nestedOpt: L1?;

    init() {
        self.nestedOpt = null;
    }
}