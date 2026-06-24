struct AddrStr {
    a: Address;
    s: String;
}

contract AddrStrTest {
    val: AddrStr;

    init() {
        self.val = AddrStr{ a:myAddress(), s:"hello" };
    }
}
