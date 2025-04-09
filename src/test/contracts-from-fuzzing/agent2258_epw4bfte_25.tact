contract AllPrimitiveTypesOpt {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address? = null;
    receive() {
        let _ = self.addr;
    }
}