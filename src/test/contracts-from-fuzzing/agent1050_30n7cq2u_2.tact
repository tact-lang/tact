struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestNestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            a: 12,
            b: true,
            c: "hello"
        };
    }
}