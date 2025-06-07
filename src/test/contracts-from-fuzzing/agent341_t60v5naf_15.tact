struct StrOpt {
    s: String?;
}

contract OptionalString {
    val: StrOpt;

    init() {
        self.val = StrOpt{ s: null };
    }
}