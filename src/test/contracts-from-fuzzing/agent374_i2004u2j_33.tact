// Optional nested param style
struct InnerOpt {
    foo: Int?;
    flag: Bool;
}

contract ParamOpt(
    inner: InnerOpt?,
    count: Int
) {
    receive() {
        if (self.inner != null) {
            let _ = self.inner!!.foo;
        }
    }
}