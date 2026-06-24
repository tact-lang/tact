struct OptOverride {
    count: Int? = null;
    label: String? = "set";
}

contract OptOverrideContractTest {
    field: OptOverride;

    init() {
        self.field = OptOverride{};
    }
}