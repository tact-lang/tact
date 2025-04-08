// test optional of optional struct field
struct Inner2 {
    v: Int;
}

struct OuterOpt {
    inn: Inner2?;
}

contract TestContract {
    f: OuterOpt?;

    init() {
        self.f = null;
    }
}