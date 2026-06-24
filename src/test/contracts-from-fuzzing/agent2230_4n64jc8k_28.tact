// deeply nested both optional and non-optional mixing
struct N1 { x: Int; y: Bool?; }
struct N2 { a: N1?; b: Int; }
struct N3 { c: N2; d: N1?; }

contract DeepMixOpt {
    data: N3;
    init() {
        self.data = N3{
            c: N2{ a: null, b: 99 },
            d: N1{ x: 7, y: null }
        };
    }
}