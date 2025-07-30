struct DefaultOptionalInt {
    x: Int? = null;
}

contract DefaultOptionalTest {
    data: DefaultOptionalInt;

    init() {
        self.data = DefaultOptionalInt{};
    }
}