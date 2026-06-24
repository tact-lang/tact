struct IntSized {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int32;
}

contract SizedIntsStorage {
    data: IntSized;

    init() {
        self.data = IntSized{ a:7, b:100, c:300, d:-100000 };
    }
}