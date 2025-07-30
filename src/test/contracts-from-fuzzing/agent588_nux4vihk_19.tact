struct Bundle {
    foo: Int?;
    bar: Bool?;
}

contract OptParam(
    bundle: Bundle?,
) {
    receive() {
        if (self.bundle != null) {
            let _ = self.bundle!!.foo;
        }
    }
}