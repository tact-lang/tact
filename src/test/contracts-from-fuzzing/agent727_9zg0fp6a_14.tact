struct Inner {
    s: String;
}

struct Middle {
    i: Int;
    inr: Inner;
}

struct Outer {
    m: Middle;
    flag: Bool;
}

contract NestedManyTypes {
    root: Outer;

    init() {
        self.root = Outer{
            m: Middle{
                i: 42,
                inr: Inner{s: "hello"}
            },
            flag: true
        };
    }
}