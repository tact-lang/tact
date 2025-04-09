struct SerializeVariants {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int257;
}

contract TestContract {
    data: SerializeVariants;

    init() {
        self.data = SerializeVariants{ a:1, b:2, c:3, d:4 };
    }
}