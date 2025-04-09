struct InnerMost {
    val: Int;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    message: String;
}

struct Outer {
    middle: Middle;
    count: Int;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: InnerMost{
                    val: 7,
                    flag: true
                },
                message: "hey"
            },
            count: 100
        };
    }
}