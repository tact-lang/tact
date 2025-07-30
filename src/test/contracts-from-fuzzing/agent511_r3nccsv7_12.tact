struct Simply {
    foo: Int;
}

contract Defaulted {
    val: Simply = Simply{ foo: 12 };

    init() {
        self.val = Simply{ foo: 42 };
    }
}