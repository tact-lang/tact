struct WithOptionals {
    num: Int?;
    txt: String?;
    addr: Address?;
    flag: Bool?;
}

contract OptionalFields {
    storage: WithOptionals;

    init() {
        self.storage = WithOptionals{
            num: null,
            txt: "hello",
            addr: null,
            flag: true,
        };
    }
}
