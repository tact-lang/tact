struct OptNest {
    inner: Inner?;
}
struct Inner {
    val: Int;
}

contract Test {
    x: OptNest;

    init() {
        self.x = OptNest{inner: null};
    }
}