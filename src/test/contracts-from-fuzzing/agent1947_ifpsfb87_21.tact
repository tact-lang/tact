struct Sub {
    x: Int;
    y: Int;
}

struct Wrap {
    s: Sub?;
}

contract OptWrap {
    data: Wrap;
    init() {
        self.data = Wrap{
            s: null,
        };
    }
}