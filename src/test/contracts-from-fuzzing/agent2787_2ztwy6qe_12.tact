struct Base {
    i: Int;
    b: Bool;
    s: String;
    ob: Bool?;
    os: String?;
    oi: Int?;
}

contract Test {
    state: Base;
    init() {
        self.state = Base{
            i: 0,
            b: true,
            s: "str",
            ob: false,
            os: null,
            oi: null
        };
    }
}
