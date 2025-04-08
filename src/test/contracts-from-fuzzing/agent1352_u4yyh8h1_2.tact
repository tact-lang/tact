struct OptFields {
    x: Int?;
    y: Bool?;
    addr: Address?;
    txt: String?;
}

contract TestContract {
    opts: OptFields;

    init() {
        self.opts = OptFields{
            x: null,
            y: true,
            addr: null,
            txt: "hello"
        };
    }
}
