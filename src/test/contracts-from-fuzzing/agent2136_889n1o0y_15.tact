struct MixedOptions {
    i: Int? = null;
    b: Bool? = null;
    a: Address? = null;
    s: String? = null;
    c: Cell? = null;
    sl: Slice? = null;
    bu: Builder? = null;
}

contract TestContract {
    mix: MixedOptions = MixedOptions{};

    init() {}
}