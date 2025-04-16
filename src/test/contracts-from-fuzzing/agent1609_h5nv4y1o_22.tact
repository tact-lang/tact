// edge case: assigning out of bounds Int to serialized small-sized persistent var
contract TestContract {
    a: Int as uint8;
    b: Int as int8;

    init() {
        self.a = 0;
        self.b = 0;
    }

    receive() {
        self.a = 256;    // out of uint8 range
        self.b = -129;   // out of int8 range
    }
}