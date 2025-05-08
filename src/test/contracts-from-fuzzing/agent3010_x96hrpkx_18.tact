struct MixOpt {
    foo: Int?;
    bar: Bool;
    txt: String?;
    num: Int;
}

contract OptWithMixed {
    payload: MixOpt;

    init() {
        self.payload = MixOpt{
            foo: null,
            bar: false,
            txt: null,
            num: 100
        };
    }
}
