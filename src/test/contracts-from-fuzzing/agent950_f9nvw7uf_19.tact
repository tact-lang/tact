// deep optional inside struct inside optional in contract
struct Wrap {
    inner: Inner?;
}

struct Inner {
    x: Int?;
    y: Bool?;
}

contract VeryDeepOpt {
    top: Wrap?;

    init() {
        self.top = null;
    }
}