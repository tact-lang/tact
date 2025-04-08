struct SLeaf {
    val: Int;
}

struct SMid {
    inner: SLeaf?;
}

struct STop {
    inner: SMid?;
}

contract MultiLevelOptionalStructs {
    s: STop;

    init() {
        self.s = STop{ inner: null };
    }
}
