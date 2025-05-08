struct InnerMost {
    z: Int;
}

struct Middle {
    inner: InnerMost;
    desc: String?;
}

contract TestContract {
    payload: Middle;

    init() {
        self.payload = Middle{ inner: InnerMost{z: 7}, desc: null };
    }

    receive() {}
}