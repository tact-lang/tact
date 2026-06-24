struct Inner {
    flag: Bool = true;
    opt: Int?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract MultiOption {
    payload: Outer;
    init() {
        self.payload = Outer{ middle: null };
    }
}