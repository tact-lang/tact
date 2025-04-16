// Deeply nested optional structs
struct Inner {
    a: Int?;
}

struct Mid {
    i: Inner?;
}

struct Outer {
    m: Mid?;
}

contract TestContract {
    d: Outer;

    init() {
        self.d = Outer{
            m: null
        };
    }
}