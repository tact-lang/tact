struct Tiny {
    n: Int as uint3;   // 3 bits
    m: Int as uint4;   // 4 bits
    b: Bool;           // 1 bit
}

contract TestContract {
    packed: Tiny;

    init() {
        self.packed = Tiny{
            n: 3,
            m: 10,
            b: true
        };
    }
}