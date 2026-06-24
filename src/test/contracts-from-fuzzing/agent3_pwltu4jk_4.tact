struct ManyNested {
    i: Int;
    s: String = "hi";
    opt: Bool?;
    inner: Inner;
}

struct Inner {
    x: Int?;
    y: Bool;
    s: String;
}

contract ComplexPersist {
    data: ManyNested;

    init() {
        self.data = ManyNested{
            i: 5,
            opt: true,
            inner: Inner{
                x: null,
                y: false,
                s: "inner"
            }
        };
    }
}