struct DefaultInt {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract DefaultInit {
    f: DefaultInt;

    init() {
        self.f = DefaultInt{};
    }
}