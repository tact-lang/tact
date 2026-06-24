struct Test {
    a: Int;
}

contract DefaultInit {
    field: Test;
    init() {
        self.field = Test{ a: 123 };
    }
}
