struct StrOpt {
    s: String?;
}

contract OptStringStruct {
    data: StrOpt;

    init() {
        self.data = StrOpt{ s: null };
    }
}