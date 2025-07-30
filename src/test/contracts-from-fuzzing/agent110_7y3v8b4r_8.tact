struct Inner {
    a: Int?;
    b: Int;
}

struct Mid {
    inner: Inner?;
    flag: Bool;
}

contract OptionalNested {
    mid: Mid;

    init() {
        self.mid = Mid{
            inner: null,
            flag: true
        };
    }
}