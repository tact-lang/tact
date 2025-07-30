struct DeepInner {
    d: Int;
    tail: Slice as remaining;
}

struct Mid {
    c: Int;
    inner: DeepInner;
}

struct Outer {
    b: Bool;
    mid: Mid;
    s: String;
}

contract TestContract {
    all: Outer;

    init() {
        self.all = Outer{
            b: true,
            mid: Mid{
                c: 5,
                inner: DeepInner{
                    d: 42,
                    tail: emptyCell().asSlice()
                }
            },
            s: "hello"
        };
    }
}