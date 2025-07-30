contract InitWithParams(
    ai: Int,
    ab: Bool,
    aa: Address,
) {
    receive() {
        let _ = self.ai;
    }
}