struct Inner {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

contract MixedPrimitiveStruct {
    complex: Inner;

    init() {
        self.complex = Inner{
            inner1: 42,
            inner2: true,
            inner3: "hello"
        };
    }
}