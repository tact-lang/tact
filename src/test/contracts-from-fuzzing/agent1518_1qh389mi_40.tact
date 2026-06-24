struct WithEnums {
    state: Int;
    role: Int;
}

contract EnumsAsInts {
    data: WithEnums;

    init() {
        self.data = WithEnums{ state: 0, role: 1 };
    }
}