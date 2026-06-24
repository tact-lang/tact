struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
    s: String = "s";
    opt: Int? = null;
    addr: Address;
}

contract Test {
    n: NestedDefaults;

    init() {
        self.n = NestedDefaults{
            addr: myAddress()
        };
    }

    receive() {}
}