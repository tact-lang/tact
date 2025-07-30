struct OptionAddress {
    addr: Address?;
    label: String;
}

contract AddrOptTest {
    val: OptionAddress;

    init() {
        self.val = OptionAddress{
            addr: null,
            label: "none",
        };
    }
}
