struct Tiny { val: Int; }
struct Inner { tiny: Tiny; }
struct Middle { inner: Inner; }
struct Outer { middle: Middle; }

contract TestContract {
    nested: Outer = Outer{ middle: Middle{ inner: Inner{ tiny: Tiny{ val: 1 } } } };

    init() {
        self.nested = Outer{ middle: Middle{ inner: Inner{ tiny: Tiny{ val: 42 } } } };
    }
}
