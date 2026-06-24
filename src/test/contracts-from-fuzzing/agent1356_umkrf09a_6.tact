struct Inner {
    flag: Bool;
    val: Int;
}

struct Middle {
    text: String;
    innerOpt: Inner?;
}

struct Outer {
    mid: Middle;
    more: Bool;
}

contract OptNested {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Middle{
                text: "hello",
                innerOpt: null,
            },
            more: true,
        };
    }
}
