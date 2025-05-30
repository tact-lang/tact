struct StructWithByteSerializedInt {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint256;
}

contract SerializedIntsTest {
    data: StructWithByteSerializedInt;

    init() {
        self.data = StructWithByteSerializedInt{a: 5, b: -100, c: 123456789};
    }

    receive() {
        self.data = StructWithByteSerializedInt{a: 1, b: 2, c: 3};
    }
}