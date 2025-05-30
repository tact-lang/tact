message((crc32("hi") + 1) & 0xFFFFFFFF) Special {
    n: Int;
}

contract TestContract {
    val: Special;

    init() {
        self.val = Special{ n: 5 };
    }

    receive() {
        self.val = Special{ n: 6 };
    }
}