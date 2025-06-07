struct WithDefaults {
    a: Int = 7;
    b: Bool = true;
}

contract StructDefaultVals {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}