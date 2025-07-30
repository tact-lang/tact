struct Inner {
    a: Int;
}

struct Mid {
    inner: Inner?;
    b: Bool?;
}

struct Outer {
    mid: Mid?;
    s: String?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            mid: null,
            s: null
        };
    }
}