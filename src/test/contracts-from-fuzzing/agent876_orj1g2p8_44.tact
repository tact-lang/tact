struct Inner {
    x: Int as uint8;
}

contract ReassignDuringInit {
    a: Inner;

    init() {
        self.a = Inner{ x: -1 };
        self.a = Inner{ x: 42 };
    }
}