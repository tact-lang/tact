struct A { a: Int; }
struct B { b: Bool; }

struct OuterWrapper {
    x: A?;
    y: B?;
    z: Int?;
}

contract OptionalWrappers {
    s: OuterWrapper;
    init() {
        self.s = OuterWrapper{
            x: null,
            y: null,
            z: null
        };
    }
}
