// edge: nested struct with defaulted nested struct & serialization
struct Inner {
    flag: Bool = true;
    small: Int as int8 = 7;
}

struct Outer {
    nested: Inner = Inner{};
    n: Int = 12;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{};
    }
}