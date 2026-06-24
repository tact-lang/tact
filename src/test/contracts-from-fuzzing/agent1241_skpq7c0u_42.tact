struct WrapOption {
    s: Some?;
}

struct Some {
    x: Int?;
    y: Bool?;
    st: String?;
}

contract OptInnerStruct {
    state: WrapOption;

    init() {
        self.state = WrapOption{
            s: null
        };
    }
}
