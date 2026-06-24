struct SDefaultOpt {
    s: String?;
}

contract OptionalDefault {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{}; // omit optional field with implicit null default
    }
}