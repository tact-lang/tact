struct Ab {
    a: Int;
    b: Int;
}

contract OverrideDefaultInInit {
    s: Ab = Ab{a: 1, b: 2};

    init() {
        self.s = Ab{a: 3, b: 4};
    }

    receive() {
        self.s = Ab{a: 5, b: 6};
    }
}
