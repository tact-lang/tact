struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner; 
    count: Int;
}

contract NestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
            },
            count: 42,
        };
    }
}
