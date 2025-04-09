struct OptionalLayer {
    nestedOpt: OptionalNested?;
}

struct OptionalNested {
    value: Int?;
    sub: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    o: OptionalLayer;
    init() {
        self.o = OptionalLayer{ nestedOpt: null };
    }
}