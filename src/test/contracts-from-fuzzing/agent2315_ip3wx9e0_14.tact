struct StrOpt {
    msg: String?;
}

contract OnlyStructOptionals {
    a: StrOpt;

    init() {
        self.a = StrOpt{ msg: null };
    }
}