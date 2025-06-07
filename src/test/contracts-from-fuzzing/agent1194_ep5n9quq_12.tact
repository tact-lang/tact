struct HasStringOpt {
    s: String?;
}

contract OptionalStringNested {
    val: HasStringOpt;

    init() {
        self.val = HasStringOpt{ s: null };
    }
}