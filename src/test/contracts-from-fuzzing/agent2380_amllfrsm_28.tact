struct L3 {
    foo: Int?;
}

struct L2 {
    next: L3?;
}

struct L1 {
    next: L2?;
}

contract TestContract {
    top: L1?;
    init() {
        self.top = null;
    }
}