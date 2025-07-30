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
    data: Outer = Outer{
        mid: Mid{
            inner: Inner{ a: 1, b: null },
            z: 2
        },
        y: null
    };

    receive() {
        let z = self.data;
    }
}