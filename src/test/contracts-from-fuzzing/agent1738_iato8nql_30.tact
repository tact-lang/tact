struct Inner {
    p: Int;
    q: Bool?;
}

struct OuterOpt {
    a: Int?;
    b: Inner?;
    c: String;
}

contract TestContract {
    maybeOuter: OuterOpt?;

    init() {
        self.maybeOuter = OuterOpt{
            a: null,
            b: Inner{ p: 5, q: null },
            c: "hi"
        };
    }
}