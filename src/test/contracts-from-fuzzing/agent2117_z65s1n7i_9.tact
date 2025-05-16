struct SDefaultOpt {
    a: Int = 7;
    b: Bool = false;
    c: Int?;  // implicitly null
    d: String? = null;
}

contract DefaultOptionalContract {
    storage: SDefaultOpt;
    init() {
        self.storage = SDefaultOpt{};
    }
}