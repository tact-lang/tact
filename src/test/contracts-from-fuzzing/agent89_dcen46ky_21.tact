struct Inner {
    s: String;
}

struct Middle {
    i: Int;
    inr: Inner;
}

struct Outer {
    m: Middle;
}

contract Fuzz21 {
    val: Outer;

    init() {
        self.val = Outer{
            m: Middle{
                i: 7,
                inr: Inner{s: "hi"},
            }
        };
    }
}