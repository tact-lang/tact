struct InnerS {
    x: Int;
    y: Int?;
}

contract StructParamComplex(
    inner: InnerS,
    flag: Bool,
    text: String
) {
    receive() {
        dump(self.inner.x);
        dump(self.inner.y);
    }
}