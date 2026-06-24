struct ManyOptionals {
    foo: Int?;
    bar: Bool?;
    text: String?;
    addr: Address?;
}

contract OptionalStructStorage {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            foo: null,
            bar: null,
            text: null,
            addr: null
        };
    }
}
