struct MultiOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    state: MultiOptionals = MultiOptionals{};
    init() {}
    receive() {
        if (self.state.a != null) {
            let _ = self.state.a!! + 1;
        }
    }
}