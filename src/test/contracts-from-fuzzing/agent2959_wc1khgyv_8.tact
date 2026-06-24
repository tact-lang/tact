struct Wrapper {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalStructFields {
    state: Wrapper;

    init() {
        self.state = Wrapper{intOpt: null, boolOpt: true};
    }
}