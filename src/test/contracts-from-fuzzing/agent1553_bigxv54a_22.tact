struct SDefaultOpt {
    x: Int?; // default null
    y: String? = null;
    z: Address? = null;
}

contract DefOpt {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{};
    }
}