message(0x21) Msg { x: Int; }

struct OptMix {
    s: String?;
    b: Bool?;
    i: Int?;
    m: Msg?;
}

contract OptionalEverything {
    state: OptMix;

    init() {
        self.state = OptMix{
            s: null,
            b: null,
            i: null,
            m: null,
        };
    }
}
