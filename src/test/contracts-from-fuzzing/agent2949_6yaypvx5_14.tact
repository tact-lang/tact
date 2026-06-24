struct DefaultInt {
    x: Int = 7;
}

contract DefaultsInStruct {
    inner: DefaultInt;

    init() {
        self.inner = DefaultInt{};
    }
}
