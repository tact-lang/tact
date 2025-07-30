struct WithDefaultOptionals {
    a: Int? = null;
    b: String? = null;
    c: Address? = null;
}

contract TestDefOpt {
    data: WithDefaultOptionals;

    init() {
        self.data = WithDefaultOptionals{};
    }
}
