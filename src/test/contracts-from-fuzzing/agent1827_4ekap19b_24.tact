struct StrOpt {
    s: String?;
}

struct MidStrOpt {
    inner: StrOpt?;
}

contract MultiLevelOptStruct {
    data: MidStrOpt;

    init() {
        self.data = MidStrOpt { inner: null };
    }
}