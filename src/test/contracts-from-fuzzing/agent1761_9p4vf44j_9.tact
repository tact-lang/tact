struct DefaultOptionals {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    addrOpt: Address? = null;
    stringOpt: String? = null;
}

contract TestContract {
    state: DefaultOptionals;

    init() {
        self.state = DefaultOptionals{};
    }
}