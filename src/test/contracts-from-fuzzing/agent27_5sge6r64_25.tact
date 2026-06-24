// struct using serialization attributes
struct Mixed {
    a: Int as uint4;
    b: Int as int64;
    c: Int as uint16;
}

contract TestContract {
    val: Mixed;
    init() {
        self.val = Mixed{
            a: 7,
            b: 1000000,
            c: 65535
        };
    }
}
