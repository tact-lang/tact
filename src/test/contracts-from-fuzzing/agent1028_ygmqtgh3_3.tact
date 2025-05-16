struct Inner {
    a: Int;
    b: Bool;
}

contract TestNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            a: 123,
            b: true
        };
    }
}