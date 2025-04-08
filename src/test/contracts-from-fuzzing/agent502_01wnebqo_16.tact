// contract with optional containing nested
struct Inner {
    f: Int;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = Inner{f:42};
    }
}