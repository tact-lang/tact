struct OptInt {
    value: Int?;
}

contract TopOpt {
    inner: OptInt;

    init() {
        self.inner = OptInt{
            value: null
        };
    }
}