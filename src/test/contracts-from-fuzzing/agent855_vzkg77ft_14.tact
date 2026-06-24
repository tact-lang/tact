struct StrOpt {
    s1: String?;
    s2: String;
}

contract OptStringPersist {
    val: StrOpt;

    init() {
        self.val = StrOpt{
            s1: null,
            s2: "defined",
        };
    }

    receive() {}
}