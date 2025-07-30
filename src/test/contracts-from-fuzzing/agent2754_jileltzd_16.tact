struct Serializable {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
}

contract SerializationTest {
    data: Serializable;

    init() {
        self.data = Serializable{
            a: 1, b: 2, c: 3
        };
    }
}
