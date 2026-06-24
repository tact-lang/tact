struct Inner {
    s: String?;
}

contract OptStructWithString {
    val: Inner?;

    init() {
        self.val = null;
    }
}