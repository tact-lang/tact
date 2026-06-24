// Contract with nested structs and optional nested fields initialized at once
struct N1 {
    x: Int?;
}

struct N2 {
    inner: N1?;
}

contract TestContract {
    n: N2;

    init() {
        self.n = N2 {
            inner: N1 {
                x: null,
            }
        };
    }
}