// Contract with nested struct holding optional Slice, Cell, Address
struct OptPrims {
    s: Slice?;
    c: Cell?;
    a: Address?;
}

contract OptionalPrimitivesTest {
    val: OptPrims;

    init() {
        self.val = OptPrims{
            s: null,
            c: null,
            a: null
        };
    }
}