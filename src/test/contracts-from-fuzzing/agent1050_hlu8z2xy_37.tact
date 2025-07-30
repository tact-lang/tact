contract MixedParamFields(
    x: Int,
    y: Bool,
    z: String,
    a: Int?,
    b: Bool?,
    c: String?,
) {
    receive() {
        let _ = self.x + 1;
    }
}
