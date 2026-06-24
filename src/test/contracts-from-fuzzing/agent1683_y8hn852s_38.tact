struct NestedChains {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
}

contract ManyNestedFields {
    chain: NestedChains;

    init() {
        self.chain = NestedChains{ inner1:1, inner2:2, inner3:3, inner4:4 };
    }

    receive() {
        self.chain = NestedChains{ inner1:11, inner2:12, inner3:13, inner4:14 };
    }
}