struct WithConsts {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultedStruct {
    s: WithConsts;

    init() {
        self.s = WithConsts{};
    }
}