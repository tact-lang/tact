// Optional struct holding a struct with inline defaults
struct DefInner {
    a: Int = 7;
    b: Bool?;
}

struct OuterOpt {
    inner: DefInner?;
}

contract OptDefaultCombo {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{
            inner: null,
        };
    }
}