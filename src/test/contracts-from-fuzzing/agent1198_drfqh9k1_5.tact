struct Inner {
    x: Int;
    y: Bool?;
    z: String?;
}

struct Outer {
    m: Int;
    n: Inner;
    o: Slice;
    p: Cell?;
}

contract TestContract {
    persistent: Outer;

    init() {
        self.persistent = Outer{
            m: -5,
            n: Inner{
                x: 7,
                y: true,
                z: null
            },
            o: emptyCell().asSlice(),
            p: null
        };
    }

    receive() {
        self.persistent = self.persistent;
    }
}