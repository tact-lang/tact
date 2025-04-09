struct InnerMost {
    z: Int;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

contract TestContract {
    data: Inner = Inner{
        x: 1,
        y: InnerMost{z: 42},
    };

    init() {}

    receive() {
        let v = self.data.y.z;
        dump(v);
    }
}