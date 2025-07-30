struct ABoolOpt {
    flag: Bool?;
}

contract StructBoolOpt {
    state: ABoolOpt;

    init() {
        self.state = ABoolOpt{ flag: null };
    }
}