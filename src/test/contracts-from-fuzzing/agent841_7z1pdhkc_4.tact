struct Inner {
    x: Int = 0;
    note: String = "inner";
    flag: Bool = true;
    optX: Int?;
}

struct Outer {
    inner: Inner;
    text: String = "outer";
    num: Int = 42;
    optInner: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 1,
                note: "deep",
                flag: false,
                optX: 123,
            },
            text: "nest",
            num: 99,
            optInner: Inner{
                x: 2,
                note: "optional",
                flag: true,
                optX: null,
            },
        };
    }
}
