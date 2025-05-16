struct Inner {
    a: Int;
    b: Int?;
}

struct Mid {
    inner: Inner;
    z: Int;
}

struct Outer {
    mid: Mid;
    y: Int?;
}

contract TestStorage {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Mid{
                inner: Inner{ a: 3, b: null },
                z: 4
            },
            y: null
        };
    }

    receive() {
        let z = self.data;
    }
}