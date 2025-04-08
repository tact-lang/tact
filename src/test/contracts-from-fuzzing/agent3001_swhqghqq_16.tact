struct OptDefs {
    v1: Int? = null;
    v2: Bool? = null;
    v3: String? = null;
}

contract OptDefContract {
    data: OptDefs;

    init() {
        self.data = OptDefs{};
    }
}
