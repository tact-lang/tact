struct ContainsStringAndAddress {
    s: String;
    a: Address;
    optS: String?;
    optA: Address?;
}

contract StringAddrTest {
    val: ContainsStringAndAddress;
    init() {
        self.val = ContainsStringAndAddress {
            s: "abc",
            a: myAddress(),
            optS: null,
            optA: null,
        };
    }
}