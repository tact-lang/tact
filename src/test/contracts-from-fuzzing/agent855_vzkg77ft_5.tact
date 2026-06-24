struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract PartialInit {
    state: Outer;

    init() {
        self.state = Outer{
            flag: false,
            // omit inner; implicit null
        };
    }

    receive() {}
}