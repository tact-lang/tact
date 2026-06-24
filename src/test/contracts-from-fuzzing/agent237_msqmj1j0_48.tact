struct DefaultsWithOptionals {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address? = null;
}

contract DefOptFields {
    data: DefaultsWithOptionals;
    init() {
        self.data = DefaultsWithOptionals{};
    }
}