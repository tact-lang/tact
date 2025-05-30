struct OptAddrCell {
    a: Address?;
    c: Cell?;
}

contract OptionalPrimitives {
    s: OptAddrCell;

    init() {
        self.s = OptAddrCell{ a: null, c: null };
    }
}
