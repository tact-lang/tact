// default serialization format edge case
contract Test {
    a: Int = 0;           // default int
    b: Int as int8 = -1; // explicit int8
    c: Int as uint16 = 255; // explicit uint16

    init() {
        self.a = 123456789;
        self.b = 100;
        self.c = 9999;
    }
}