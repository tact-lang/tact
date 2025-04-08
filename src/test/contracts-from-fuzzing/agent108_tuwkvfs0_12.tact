struct Bottom {
    id: Int? = null;
    info: String? = null;
}

struct MidLevel {
    bottom: Bottom? = null;
    flag: Bool? = null;
}

struct TopLevel {
    mid: MidLevel? = null;
    remark: String? = null;
}

contract Test11 {
    data: TopLevel;

    init() {
        self.data = TopLevel{};
    }
}