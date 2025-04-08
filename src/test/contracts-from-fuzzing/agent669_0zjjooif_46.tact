struct DefaultInt {
    a: Int = 10;
}

contract ConstDefaultInt {
    val: DefaultInt;

    init() {
        self.val = DefaultInt{};
    }
}