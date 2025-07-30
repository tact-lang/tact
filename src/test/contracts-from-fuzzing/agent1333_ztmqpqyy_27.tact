message ((crc32("hello") + 1) & 0xFFFF_FFFF) WeirdMsg {
    i: Int;
}

contract TestContract {
    m: WeirdMsg = WeirdMsg{i: 42};

    init() {}

    receive() {
        dump(self.m.i);
    }
}