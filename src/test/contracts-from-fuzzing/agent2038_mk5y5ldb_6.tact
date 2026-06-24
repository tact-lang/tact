struct Mid {
    n: Nested;
    optional: Int?;
}

struct Nested {
    inner: Inner;
    b: Bool;
}

struct Inner {
    s: String;
}

contract TestContract {
    mid: Mid;

    init() {
        self.mid = Mid{n: Nested{inner: Inner{s: "abc"}, b: false}, optional: null};
    }
}
