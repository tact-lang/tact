// test optional struct containing optional primitive
struct Inner {
    val: Int?;
}

contract TestContract {
    st: Inner?;

    init() {
        self.st = null;
    }
}