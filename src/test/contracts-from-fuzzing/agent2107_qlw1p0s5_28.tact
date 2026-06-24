struct S { x: Bool; y: Int; z: String? }

contract NestedCombo {
    rec: S;

    init() {
        self.rec = S {
            x: false,
            y: 100,
            z: null,
        };
    }
}