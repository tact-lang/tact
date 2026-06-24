struct WithDefaultInts {
    a: Int = 1;
    b: Int = 2;
}

contract DefaultFieldValues {
    data: WithDefaultInts;

    init() {
        self.data = WithDefaultInts{};
    }
}
