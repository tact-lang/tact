struct Inner {
    flag: Bool;
    value: Int;
}

struct Middle {
    inner: Inner;
    name: String;
}

struct Outer {
    mid: Middle;
    count: Int;
}

contract DeepNested {
    deep: Outer;

    init() {
        self.deep = Outer{
            mid: Middle{
                inner: Inner{flag: true, value: 5},
                name: "deep"
            },
            count: 10
        };
    }
}