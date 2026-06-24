struct Inner { x: Int; }
struct Outer { inner: Inner?; y: String; }

contract OptStructInOpt {
    val: Outer?;

    init() {
        self.val = null;
    }
}