struct OptOnly { f: Int?; }

contract TestContract {
    s: OptOnly;
    init() {
        self.s = OptOnly{};
    }
}
