struct Inner {
    b: Bool?;
    s: String?;
}

struct Outer {
    inner: Inner?;
    flag: Bool?;
    msg: String?;
}

contract MultiLayerOpt {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            flag: null,
            msg: null
        };
    }
}