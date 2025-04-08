// sequential Int serialized sizes, multiple persistent fields
contract SerializationVariants {
    i1: Int as int8;
    i2: Int as uint8;
    i3: Int as int16;
    i4: Int as uint16;
    i5: Int as int32;
    i6: Int as uint32;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
        self.i6 = 6;
    }
}