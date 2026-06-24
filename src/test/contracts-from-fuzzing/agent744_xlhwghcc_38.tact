struct DefaultToNulls {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract TestContract {
    x: DefaultToNulls;

    init() {
        self.x = DefaultToNulls{};
    }
}