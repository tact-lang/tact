contract TestContract(
    x: Int,
    y: Bool,
    z: Address,
    a0: Int,
    a1: Bool,
    a2: Address,
    a3: Int,
    a4: Bool,
    a5: Address
) {
    receive() {
        // dummy usage to ensure compilation
        let _ = self.x + self.a0 + self.a3;
    }
}