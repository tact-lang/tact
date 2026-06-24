struct SpecSer {
    a: Int as uint64;
    b: Int as uint32;
}

contract SpecSerStorage {
    val: SpecSer;
    init() {
        self.val = SpecSer{
            a: 12345678,
            b: 12345,
        };
    }
}