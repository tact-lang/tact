struct Inner {
    a: Int;
    b: Bool;
    text: String;
}

contract NestedStruct {
    data: Inner;

    init() {
        self.data = Inner{
            a: 1,
            b: true,
            text: "hi",
        };
    }
}