struct Inner {
    val: String;
}

contract LongStringInit {
    inner: Inner;
    init() {
        self.inner = Inner{ val: "abcdefghijklmnopqrstuvwxyz0123456789" };
    }
}