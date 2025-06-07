struct Weird {
    tiny: Int as int1 = 0;
    huge: Int as int257 = 123456789;
    opt: Int? = null;
}

contract Test {
    w: Weird;

    init() {
        self.w = Weird{ tiny: 1, huge: -123456789, opt: null };
    }
}