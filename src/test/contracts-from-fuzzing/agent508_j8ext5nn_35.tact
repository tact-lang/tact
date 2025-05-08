// deeply nested optional struct several layers, see if compiler accepts

struct L3 {
    x: Int;
}

struct L2 {
    n: L3?;
}

struct L1 {
    m: L2?;
}

contract DeepOpt {
    val: L1;
    init() {
        self.val = L1{ m: null };
    }
}
