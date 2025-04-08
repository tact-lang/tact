struct L1 {
    x: Int;
}

struct L2 {
    inner: L1?;
}

struct L3 {
    inner2: L2?;
}

struct L4 {
    inner3: L3?;
}

contract OptOfOptStructs {
    value: L4?;
    f2: Bool = false;
    f3: Int = 9;

    init() {
        self.value = null;
    }
}