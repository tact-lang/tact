struct ManyDefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract ManyDefaultsOptContract {
    s: ManyDefaultsOpt = ManyDefaultsOpt{};
}