contract OptParams(
    a: Int?,
    b: Bool?,
    s: String?,
    addr: Address?,
) {
    receive() {
        let _ = self.b;
    }
}