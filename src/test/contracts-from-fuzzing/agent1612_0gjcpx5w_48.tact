// contract with a struct holding optionals of slices, cells, addresses
struct Holder {
    s: Slice?;
    c: Cell?;
    a: Address?;
}

contract OptVariants {
    val: Holder?;

    init() {
        self.val = null;
    }
}
