// Struct with struct default inline, optional nested
struct Inner {
    v: Int;
    s: String;
}

struct Outer {
    inn: Inner = Inner{ v: 5, s: "foo" };
    optIn: Inner? = null;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}