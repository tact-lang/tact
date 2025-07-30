struct OneFieldOpt {
    val: Int?;
}

contract OptionalInitOmitted {
    f: OneFieldOpt;

    init() {
        self.f = OneFieldOpt{}; // omit optional init, expect default null
    }
}