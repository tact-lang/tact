struct WithOptDefault {
    opt: Int? = null;
}

contract Test7 {
    wd: WithOptDefault;

    init() {
        self.wd = WithOptDefault{};
    }

    receive() {}
}