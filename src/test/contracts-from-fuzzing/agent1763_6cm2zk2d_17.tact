struct NestedOptionalPrims {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
}

contract TestContract(p: NestedOptionalPrims) {
    receive() {
        let _ = self.p;
    }
}