struct WithBoolOpt {
    flag: Bool?;
}

contract BoolOptStorage {
    data: WithBoolOpt;

    init() {
        self.data = WithBoolOpt{};
    }

    receive() {
        let _ = self.data;
    }
}