struct Inner {
    y: Int;
}

struct Outer {
    x: Inner?;
    z: Int;
}

contract ParamNestedOpt(
    val: Outer?
) {
    receive() {
        // read opt param
        if (self.val != null) {
            let _ = self.val!!.z;
        }
    }
}