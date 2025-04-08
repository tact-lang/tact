struct WithString {
    s: String;
}

contract OptionalStringDefault {
    sopt: WithString? = null;

    init() {
        self.sopt = null;
    }
}