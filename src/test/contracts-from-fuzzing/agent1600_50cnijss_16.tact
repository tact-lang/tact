struct Packed {
    a: Int as uint4;
    b: Int as int64;
    c: Bool;
}

contract TestContract {
    data: Packed;

    init() {
        self.data = Packed{
            a: 7,
            b: 123456789,
            c: true
        };
    }
}