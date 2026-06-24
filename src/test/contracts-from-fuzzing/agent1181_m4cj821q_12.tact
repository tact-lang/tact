struct Outer {
    id: Int;
    middle: Middle;
}

struct Middle {
    optInner: Inner?;
}

struct Inner {
    name: String;
    flag: Bool?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            id: 5,
            middle: Middle{
                optInner: null
            }
        };
    }
}