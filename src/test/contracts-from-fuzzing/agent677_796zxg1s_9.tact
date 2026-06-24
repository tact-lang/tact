struct InnerMost { val: Int?; }
struct Inner { im: InnerMost; }

contract OptInDeep {
    s: Inner;

    init() {
        self.s = Inner{ im: InnerMost{ val: null } };
    }
}