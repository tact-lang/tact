// Optional struct inside optional struct
struct Inner {
    val: Int;
}

struct Outer {
    inner: Inner?;
}

contract OptOpt {
    state: Outer?;

    init() {
        self.state = Outer { inner: Inner { val: 1 } };
    }

    receive() {
        if (self.state != null && self.state!!.inner != null) {
            let _ = self.state!!.inner!!;
        }
    }
}