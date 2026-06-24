struct Tiny {
    a: Int as uint4;
    b: Int as uint4;
}

contract TinyBits {
    st: Tiny;
    init() {
        self.st = Tiny{a:7,b:9};
    }
}
