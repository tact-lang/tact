struct BoolStringInt {
    b: Bool;
    s: String;
    i: Int;
}

contract MixedTypes {
    data: BoolStringInt;

    init() {
        self.data = BoolStringInt{
            b: true,
            s: "hello",
            i: 42
        };
    }
}