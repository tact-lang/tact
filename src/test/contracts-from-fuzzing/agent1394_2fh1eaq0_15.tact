struct StrOpt {
    s: String?;
}

contract OptStringField {
    f: StrOpt;

    init() {
        self.f = StrOpt{ s: null };
    }
}