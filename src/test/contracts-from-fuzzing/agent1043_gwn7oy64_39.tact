// Test optional of struct
struct Inner {
    a: Int;
}

struct OuterOpt {
    maybe: Inner?;
}

contract TestContract {
    f: OuterOpt;

    init() {
        self.f = OuterOpt{ maybe: null };
    }
}