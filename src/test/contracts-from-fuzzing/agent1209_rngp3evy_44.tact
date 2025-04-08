struct MultiLevel {
    i: Int;
    b: Bool?;
    s: String;
}

struct Wrap {
    inner: MultiLevel;
    t: String?;
}

contract MultiLevNest {
    val: Wrap;
    init() {
        self.val = Wrap{
            inner: MultiLevel{i: 42, b: null, s: "hi"},
            t: null
        };
    }
}