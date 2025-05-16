struct Holder {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract Defaults {
    state: Holder;

    init() {
        self.state = Holder{};
    }
}