struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
}

contract WideOptionalFields {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }

    receive() {
        if (self.state.a == null) {
            self.state.a = 1;
        } else {
            self.state.a = self.state.a!! + 1;
        }
    }
}