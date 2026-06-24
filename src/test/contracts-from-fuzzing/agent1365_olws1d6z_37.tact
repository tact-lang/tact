struct WithString {
    s: String;
}

contract OptionalS {
    opt: WithString?;

    init() {
        self.opt = null;
    }
}