struct Defaults {
    a: Int = 100 + 23;
    b: Bool = (3 != 4);
    c: Int = crc32("x") * 2;
}

contract StructComputed {
    d: Defaults = Defaults{};

    init() {
        self.d = Defaults{a:1,b:false,c:0};
    }
}