struct Inner {
    x: Int;
    y: Int;
}

struct Wrapper {
    inner1: Inner;
    optInner2: Inner?;
    boolVal: Bool;
    num: Int as uint32;
    text: String;
}

contract TestContract {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            inner1: Inner{ x:1, y:2 },
            optInner2: null,
            boolVal: true,
            num: 123,
            text: "hello"
        };
    }
}