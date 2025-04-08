struct Inner {
    v: Int;
    flag: Bool?;
}

struct Container {
    optInner: Inner?;
    plainInt: Int;
    maybeAddr: Address?;
}

contract TestContract {
    state: Container;

    init() {
        self.state = Container{
            optInner: null,
            plainInt: 123,
            maybeAddr: null
        };
    }

    receive() {
        if (self.state.optInner != null) {
            let _ = self.state.optInner!!.v;
            if (self.state.optInner!!.flag != null) {
                let _ = self.state.optInner!!.flag!!;
            }
        }
        let _ = self.state.plainInt;
        if (self.state.maybeAddr != null) {
            let _ = self.state.maybeAddr!!;
        }
    }
}