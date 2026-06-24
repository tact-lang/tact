struct Inner {
    i: Int?;
    s: String?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalInOptional {
    state: Outer;

    init() {
        self.state = Outer{ inner: null };
    }
}