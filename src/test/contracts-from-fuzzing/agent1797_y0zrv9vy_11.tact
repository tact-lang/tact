struct OptionalInt { x: Int?; }

contract Test {
    oi: OptionalInt;
    init() {
        self.oi = OptionalInt{ x: 1 };
    }
}