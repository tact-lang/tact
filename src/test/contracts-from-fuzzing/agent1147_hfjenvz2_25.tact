// optional struct as top-level field
struct Inner {
    a: Int;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = null;
    }
}