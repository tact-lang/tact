struct Inner {
    flag: Bool;
    text: String;
}

struct Middle {
    val: Int;
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract ThreeLevelNest {
    stored: Outer;

    init() {
        self.stored = Outer{
            middle: Middle{
                val: 123,
                inner: Inner{
                    flag: true,
                    text: "data"
                }
            }
        };
    }
}