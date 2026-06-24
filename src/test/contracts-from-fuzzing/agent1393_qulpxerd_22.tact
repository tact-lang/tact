// Contract with default values in contract storage fields
contract ContractDefaults {
    x: Int = 10;
    y: Bool = false;
    s: String = "foo";
    addr: Address;

    init() {
        self.addr = myAddress();
    }
}
