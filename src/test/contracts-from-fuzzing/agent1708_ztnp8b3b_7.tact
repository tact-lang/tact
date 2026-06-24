struct Deep2 { c: Int?; d: Bool = true; }

struct Deep1 { a: Int?; b: Deep2; }

struct Root { inner: Deep1; s: String?; }

contract TestContract {
    data: Root;

    init() {
        self.data = Root{
            inner: Deep1{
                a: null,
                b: Deep2{
                    c: null
                    // omit d, defaults true
                }
            },
            s: null
        };
    }
}
