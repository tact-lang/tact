struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    im: InnerMost;
    s: String;
    c: Cell;
    o: Int?;
}

struct Container {
    flag: Bool;
    inner: Inner;
    num: Int;
    optInner: Inner?;
    str: String;
}

contract DeepNesting {
    data: Container;
    
    init() {
        self.data = Container{
            flag: true,
            inner: Inner{
                im: InnerMost{a: 1, b: false},
                s: "hello",
                c: emptyCell(),
                o: null,
            },
            num: 42,
            optInner: null,
            str: "deep"
        };
    }
}