struct MultiLevelOpt {
    a: Int?;
    s: String?;
    b: Bool?;
}

struct Wrapper {
    lvl: MultiLevelOpt;
}

contract MultiOptWrap {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            lvl: MultiLevelOpt{
                a: null,
                s: null,
                b: null
            }
        };
    }
}
