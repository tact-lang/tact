struct Inner {
    s: String;
}

contract MaybeNested {
    val: Inner?;

    init() {
        self.val = null;
    }
}