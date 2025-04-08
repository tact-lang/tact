struct HasDefaultOptionals {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
}

contract TestContract {
    dopt: HasDefaultOptionals;

    init() {
        self.dopt = HasDefaultOptionals{};
    }
}