struct L4 {
    x: Int;
}

struct L3 {
    child: L4?;
}

struct L2 {
    node: L3?;
}

struct L1 {
    top: L2?;
}

contract DeepOptionalChain {
    payload: L1?;

    init() {
        self.payload = null;
    }
}