// contract parameters syntax with multiple types
contract ParamsMix(
    pi: Int,
    pb: Bool,
    ps: String,
    pc: Cell,
    psl: Slice,
    pa: Address,
) {
    receive() {
        // access via self
        let _ = self.pi + 1;
    }
}