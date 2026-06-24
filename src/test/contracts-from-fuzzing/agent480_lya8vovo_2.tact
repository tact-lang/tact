struct Inner {
    flag: Bool;
    message: String?;
}

struct Outer {
    number: Int;
    inner: Inner;
}

contract NestedStructStorage {
    info: Outer;

    init() {
        self.info = Outer{
            number: 10,
            inner: Inner{
                flag: false,
                message: null,
            },
        };
    }
}