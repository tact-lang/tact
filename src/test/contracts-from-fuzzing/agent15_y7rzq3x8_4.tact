struct Inner {
    s1: String;
    s2: String?;
    flag: Bool;
}

struct Middle {
    count: Int;
    inner: Inner;
}

struct Outer {
    id: Int;
    middle: Middle;
    note: String;
    optInner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            id: 1,
            middle: Middle{
                count: 10,
                inner: Inner{
                    s1: "one",
                    s2: null,
                    flag: true,
                },
            },
            note: "test",
            optInner: null,
        };
    }
}