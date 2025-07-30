struct WithDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract Defaults {
    inner: WithDefault;

    init() {
        self.inner = WithDefault{
            d: myAddress()
        };
    }
}