struct EmptyInit {
    foo: Int;
}

contract Test {
    abc: EmptyInit;
    init() {
        self.abc = EmptyInit{ foo: 42 };
    }
}