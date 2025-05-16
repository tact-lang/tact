struct L3 {
    z: Int;
}

struct L2 {
    y: L3?;
}

struct L1 {
    x: L2?;
}

contract TestContract {
    deepOpt: L1? = null;

    init() {
        self.deepOpt = null;
    }
}