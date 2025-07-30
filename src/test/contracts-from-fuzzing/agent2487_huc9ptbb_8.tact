struct OptionalStringInt {
    s: String?;
    n: Int?;
}

contract TestContract {
    mixed: OptionalStringInt;

    init() {
        self.mixed = OptionalStringInt{
            s: null,
            n: null
        };
    }
}