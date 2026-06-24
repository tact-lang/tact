struct OptionalStringInt {
    s: String?;
    i: Int?;
}

contract TestContract {
    data: OptionalStringInt;
    init() {
        self.data = OptionalStringInt{
            s: null,
            i: null
        };
    }
}