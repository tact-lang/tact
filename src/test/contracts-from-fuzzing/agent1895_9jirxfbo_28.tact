struct WithStringOpt {
    s: String?;
}

contract StringOptField {
    val: WithStringOpt;
    init() {
        self.val = WithStringOpt{ s: null };
    }
}