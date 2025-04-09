struct SInner {
    i: Int;
    f: Bool?;
}

struct SMid {
    inner: SInner;
    label: String;
}

contract OptDeep {
    d: SMid?;
    init() {
        self.d = null;
    }
}