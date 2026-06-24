struct Pair {
    a: Int;
    b: Int;
}

struct Wrap {
    data: Pair;
}

contract PairWrapper {
    inner: Wrap;
    
    init() {
        self.inner = Wrap{ data: Pair { a:1, b:2 }};
    }
}