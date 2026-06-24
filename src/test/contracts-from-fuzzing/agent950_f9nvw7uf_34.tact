// optional struct nested in optional struct mixing nulls and filled
struct SInner {
    foo: Int?;
}

struct SMid {
    inner: SInner?;
    flag: Bool?;
}

contract ChainMix {
    top: SMid?;

    init() {
        self.top = null;
    }
}