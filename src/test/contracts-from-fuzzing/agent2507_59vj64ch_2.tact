struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 10,
                b: null,
            },
            flag: true,
        };
    }
}