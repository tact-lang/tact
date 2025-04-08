struct WithOptionals {
    a: Int?;
    b: Bool?;
    addr: Address?;
    message: String?;
}

contract OptionalTest {
    info: WithOptionals;

    init() {
        self.info = WithOptionals{
            a: null,
            b: null,
            addr: null,
            message: null,
        };
    }

    receive() {}
}
