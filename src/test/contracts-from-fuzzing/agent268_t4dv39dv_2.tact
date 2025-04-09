struct Inner {
    nestedInt: Int;
    nestedBool: Bool;
}

contract TestContract {
    field1: Int;
    field2: Inner;
    init() {
        self.field1 = 42;
        self.field2 = Inner { nestedInt: 1, nestedBool: true };
    }
}