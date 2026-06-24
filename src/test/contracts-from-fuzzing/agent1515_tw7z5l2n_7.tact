struct Inner {
    x: Int?;
    y: Bool = false;
}

struct Outer {
    left: Inner;
    right: Inner;
    z: String = "hi";
}

contract NestedOpts {
    data: Outer;

    init() {
        self.data = Outer{
            left: Inner{ x: null, y: true },
            right: Inner{ x: 42, y: false },
            z: "fuzz",
        };
    }

    receive() {
        dump(self.data.z);
    }
}