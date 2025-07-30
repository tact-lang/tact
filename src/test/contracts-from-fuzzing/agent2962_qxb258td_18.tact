struct TinyBits {
    f1: Int as uint1;
    f2: Int as uint4;
    f3: Bool;          // occupies 1 bit
    f4: Int as int3;
    label: String;
}

contract TinyBitsStorage {
    data: TinyBits;

    init() {
        self.data = TinyBits{
            f1: 1,
            f2: 7,
            f3: true,
            f4: -3,
            label: "tiny"
        };
    }
}