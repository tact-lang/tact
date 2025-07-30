struct Sub {
    val: Int as uint32;
}

contract Test50 {
    direct: Int as uint32;
    nested: Sub;

    init() {
        self.direct = 123;
        self.nested = Sub{ val: 456 };
    }
}