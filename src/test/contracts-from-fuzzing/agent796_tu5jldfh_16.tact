// Contract storing optional of struct with nested optional inside struct field
struct Inner {
    x: Int?;
}

struct Middle {
    inner: Inner?;
}

contract TestContract {
    m: Middle?;

    init() {
        self.m = null;
    }
}