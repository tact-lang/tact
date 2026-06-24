struct WithOptionDefault {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract StructOptDefault {
    val: WithOptionDefault;

    init() {
        self.val = WithOptionDefault{};
    }
}