struct S1 { a: Int; b: Int?; }
struct S2 { x: S1; y: Int; z: S1?; }
contract OptionalStructsDeep {
    state: S2;

    init() {
        self.state = S2{
            x: S1{ a: 1, b: null },
            y: 2,
            z: null
        };
    }
}