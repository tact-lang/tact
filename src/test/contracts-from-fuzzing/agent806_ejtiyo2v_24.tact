struct Middle {
    m1: Int;
    m2: Inner;
}

struct Inner {
    val: String;
    flag: Bool;
}

struct Outer {
    o1: Int;
    mid: Middle;
    extra: String?;
}

contract TestContract {
    stuff: Outer;
    init() {
        self.stuff = Outer{
            o1: 5,
            mid: Middle{
                m1: 10,
                m2: Inner{
                    val: "hi",
                    flag: true
                }
            },
            extra: null
        };
    }
}