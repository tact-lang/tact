// Persistent state: optional struct with optional primitive inside
struct Sub {
    val: Int?;
}

contract OptOpt {
    inner: Sub?;

    init() {
        self.inner = Sub{val: null};
    }
}