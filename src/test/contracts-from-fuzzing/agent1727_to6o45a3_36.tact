// contract with persistent variable serialization narrowing
contract SerializeNarrow {
    foo: Int as uint4; // only 4 bits wide

    init() {
        self.foo = 18; // 10010b = 5 bits, should overflow
    }

    receive() {}
}