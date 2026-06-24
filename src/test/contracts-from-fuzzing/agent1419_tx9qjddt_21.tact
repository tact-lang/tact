contract OptionalParamContract(
    a: Int?,
    b: String?,
    c: Bool?,
) {
    receive() {
        dump(self.a);
        dump(self.b);
        dump(self.c);
    }
}