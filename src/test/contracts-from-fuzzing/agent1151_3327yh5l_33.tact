contract NullDefaultsParamsNoEq(
    a: Int?,
    b: Bool?,
    c: String?
) {
    receive() {
        dump(self.a);
    }
}