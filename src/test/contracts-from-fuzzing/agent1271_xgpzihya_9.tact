struct BigS {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    addr1: Address;
    addr2: Address;
    flag: Bool;
    num: Int;
}

contract BigStructField {
    stash: BigS;
    init() {
        let a = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.stash = BigS{
            i1: 1,
            i2: 2,
            b1: true,
            b2: false,
            s1: "abc",
            s2: "def",
            addr1: a,
            addr2: a,
            flag: true,
            num: 42
        };
    }
    receive() {}
}