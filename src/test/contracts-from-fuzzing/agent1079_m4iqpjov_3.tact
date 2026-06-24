struct Inner {
    n: Int?;
    s: String?;
    b: Bool?;
}

struct Outer {
    wrap: Inner;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            wrap: Inner{
                n: null,
                s: null,
                b: null,
            },
        };
    }
}