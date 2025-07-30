struct Inner {
    a: Int;
}

contract OptionalNestedInit {
    data: Inner?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}