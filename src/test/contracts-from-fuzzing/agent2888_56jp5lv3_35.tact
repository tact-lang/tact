// test trailing comma optional params contract
contract TrailingComma(
    a: Int?,
    b: String?,
    c: Bool?,
) {
    receive() {
        let _ = self.a;
    }
}