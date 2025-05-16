struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: Inner;
    flag: Bool?;
}

struct Outer {
    mid: Middle;
    s: String;
}

contract DeepNested {
    deep: Outer;

    init() {
        self.deep = Outer{
            mid: Middle{
                inner: Inner{
                    x: 5,
                    y: true,
                },
                flag: null,
            },
            s: "hello",
        };
    }
}