struct OptionalStringInt {
    foo: String?;
    bar: Int?;
}

contract OptionalMix {
    st: OptionalStringInt;

    init() {
        self.st = OptionalStringInt{
            foo: null,
            bar: null
        };
    }
}