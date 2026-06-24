struct InnerSerial {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
}

contract SerialStruct {
    data: InnerSerial;

    init() {
        self.data = InnerSerial{a:1,b:2,c:3};
    }
}