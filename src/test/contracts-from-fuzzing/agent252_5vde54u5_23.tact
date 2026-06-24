struct DefaultInt {
    foo: Int = 42;
    bar: Int = 100;
}

contract DefaultsInStruct {
    val: DefaultInt;

    init() {
        self.val = DefaultInt{};
    }
}