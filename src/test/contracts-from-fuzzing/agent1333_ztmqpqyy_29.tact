struct Inner {
    a: Int = 123;
    b: Bool = false;
}

struct Outer {
    nested: Inner = Inner{};
    count: Int = 5;
}

contract TestContract {
    o: Outer = Outer{};

    init() {}

    receive() {
        dump(self.o.nested.a);
        dump(self.o.nested.b);
        dump(self.o.count);
    }
}