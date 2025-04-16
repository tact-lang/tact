contract Fuzz37 {
    foo: Int as uint8;

    init() {
        self.foo = 300; // overflow for uint8 (max 255)
    }
}