struct Inner {
    foo: Int;
}

struct Outer {
    nested: Inner?;
}

contract Test(
    param: Outer?,
) {
    receive() {
        if (self.param != null) {
            let _= self.param!!.nested;
        }
    }
}