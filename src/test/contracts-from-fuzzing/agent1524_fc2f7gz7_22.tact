// contract parameters with nested struct optional
struct ParNested {
    inner: Int?;
}

contract ParOpt(
    p: ParNested?,
) {
    receive() {
        if (self.p != null) {
            let _ = self.p!!.inner;
        }
    }
}