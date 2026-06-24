struct Deep2 {
    c: Int?;
}

struct Deep1 {
    b: Deep2?;
}

contract TestContract {
    nested: Deep1;

    init() {
        self.nested = Deep1 {
            b: Deep2 { c: null }
        };
    }
}