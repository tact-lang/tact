struct SDefaultOpt {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract DefaultsOptContract {
    d: SDefaultOpt;

    init() {
        self.d = SDefaultOpt{};
    }
}