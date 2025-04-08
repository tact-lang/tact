struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    inner: Inner;
    number: Int;
}

contract StorageTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                count: 5,
            },
            number: 10,
        };
    }
}