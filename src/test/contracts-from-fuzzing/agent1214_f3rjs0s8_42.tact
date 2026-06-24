struct SSub {
    foo: String;
}

struct SMid {
    sub: SSub;
}

struct STop {
    mid: SMid;
    flag: Bool;
}

contract MultiLevelOptionals {
    data: STop?;
    init() {
        self.data = null;
    }
}