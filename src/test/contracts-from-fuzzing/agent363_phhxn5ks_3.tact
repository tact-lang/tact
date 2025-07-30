struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: InnerMost;
    z: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{x: 5, y: true},
                z: "hello"
            },
            flag: false
        };
    }

    receive() {}
}