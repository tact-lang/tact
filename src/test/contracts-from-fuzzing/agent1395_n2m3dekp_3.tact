struct ManyOptionals {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    txt: String?;
    nestedOpt: Int?;
}

contract OptionalsContract {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            foo: null,
            bar: true,
            addr: null,
            txt: "hi",
            nestedOpt: null
        };
    }
}