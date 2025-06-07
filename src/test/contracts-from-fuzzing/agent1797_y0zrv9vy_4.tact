struct OptionalNest { inner: Simple?; }
struct Simple { x: Int; }

contract Test {
    optNested: OptionalNest;

    init() {
        self.optNested = OptionalNest{ inner: null };
    }
}