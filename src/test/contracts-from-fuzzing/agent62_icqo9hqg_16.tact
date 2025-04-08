struct EmptyOptWrap {
    f: Int?;
}

contract DefaultOpt {
    state: EmptyOptWrap;

    init() {
        self.state = EmptyOptWrap{ f: null };
    }
}