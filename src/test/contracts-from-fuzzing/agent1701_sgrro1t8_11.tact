struct Outer {
    x: Int;
    y: Middle;
}

struct Middle {
    z: Inner;
}

struct Inner {
    t: String;
}

contract NestedWithString {
    store: Outer;

    init() {
        self.store = Outer{
            x: 1,
            y: Middle{
                z: Inner{
                    t: "abc"
                }
            }
        };
    }
}