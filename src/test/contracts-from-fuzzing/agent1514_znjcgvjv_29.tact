struct InnerMost {
    val: Int;
}

struct Mid1 {
    im: InnerMost;
}

struct Mid2 {
    m1: Mid1;
}

struct Mid3 {
    m2: Mid2;
}

contract OptionalDeepChain {
    data: Mid3?;

    init() {
        self.data = null;
    }
}