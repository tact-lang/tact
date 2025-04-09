struct RecA {
    foo: Int as uint8;
    bar: Int as int16;
}

contract Test {
    x: RecA;

    init() {
        self.x = RecA{
            foo: 5,
            bar: -100,
        };
    }
}