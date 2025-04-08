struct WithOptionalAndDefaults {
    n: Int?;
    b: Bool = false;
    s: String?;
    addr: Address;
}

contract OptsDefaults {
    data: WithOptionalAndDefaults;
    init() {
        self.data = WithOptionalAndDefaults{
            n: null,
            b: true,
            s: "hello",
            addr: myAddress()
        };
    }
}