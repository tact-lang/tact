struct Inner {
    foo: Int? = null;
}

struct Outer {
    inn: Inner = Inner{};
}

contract OptionalDefaultNested {
    data: Outer;

    init() {
        self.data = Outer{}; // rely only on struct defaults
    }
}
