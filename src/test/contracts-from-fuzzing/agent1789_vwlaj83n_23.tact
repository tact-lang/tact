struct BaseLayer {
    a: Int;
    b: Bool;
}

struct MidLayer {
    c: BaseLayer;
    d: Bool?;
}

contract NestedOptionals {
    e: MidLayer;

    init() {
        self.e = MidLayer{
            c: BaseLayer{ a: 5, b: true },
            d: null
        };
    }
}