struct TailOpt {
    x: Int;
    y: Int?;
}

struct MiddleOpt {
    inner: TailOpt?;
}

contract OptionalInMiddle {
    state: MiddleOpt;

    init() {
        self.state = MiddleOpt { inner: TailOpt { x: 5, y: null } };
    }

    receive() {
        if (self.state.inner != null) {
            let x = self.state.inner!!.x;
            let y = self.state.inner!!.y;
        }
    }
}
