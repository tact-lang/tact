struct NestedStrOpt {
    s: String?;
}

contract DefAndOpt {
    f: NestedStrOpt;
    init() {
        self.f = NestedStrOpt{s: null};
    }
}