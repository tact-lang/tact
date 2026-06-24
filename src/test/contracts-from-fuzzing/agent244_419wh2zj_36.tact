// Very long nested chain with mix optional and non-optional, deeply nested
struct L5 {
    a: Int;
}

struct L4 {
    n: L5?;
}

struct L3 {
    n: L4;
}

struct L2 {
    n: L3?;
}

struct L1 {
    n: L2;
}

contract LongDeepMix {
    root: L1;

    init() {
        self.root = L1{
            n: L2{
                n: null
            }
        };
    }
}