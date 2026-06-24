// Explicitly test optional struct as contract field
struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}
