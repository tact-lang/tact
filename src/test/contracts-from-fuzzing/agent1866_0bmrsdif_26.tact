// Contract parameter syntax instead fields initialization
contract ParamsTest(
    a: Int,
    b: Bool,
    c: Int?,
    d: Bool?,
    e: String,
    f: String?,
) {
    receive() {
        // dummy ref
        let _ = self.a + 1;
    }
}