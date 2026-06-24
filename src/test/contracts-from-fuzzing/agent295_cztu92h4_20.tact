// Contract with large amount of small-sized ints, testing serialization edge
contract ManyUint8s {
    a: Int as uint8 = 1;
    b: Int as uint8 = 2;
    c: Int as uint8 = 3;
    d: Int as uint8 = 4;
    e: Int as uint8 = 5;
    f: Int as uint8 = 6;
    g: Int as uint8 = 7;
    h: Int as uint8 = 8;
    i: Int as uint8 = 9;
    j: Int as uint8 = 10;
    
    init() {
        self.j = 255;
    }

    receive() {
        self.a = self.a;
    }
}