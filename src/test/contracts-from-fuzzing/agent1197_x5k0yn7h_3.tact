struct WithOptionals {
    i: Int?;
    s: String?;
    b: Bool?;
}

contract TestContract {
    x: WithOptionals;

    init() {
        self.x = WithOptionals{ i: null, s: null, b: null };
    }
}