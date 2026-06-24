struct NestedBoolOpt {
    a: Bool? = null;
    b: Bool? = true;
}

contract NestedBoolOptContract {
    f: NestedBoolOpt;

    init() {
        self.f = NestedBoolOpt{};
    }
}