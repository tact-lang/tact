struct Complex {
    field1: Int as uint8;
    field2: Int as int16;
    field3: Int as coins;
    field4: Bool;
    field5: String;
}

contract Comp {
    c: Complex;
    init() {
        self.c = Complex{
            field1: 5,
            field2: -123,
            field3: 1000,
            field4: true,
            field5: "hello"
        };
    }
}