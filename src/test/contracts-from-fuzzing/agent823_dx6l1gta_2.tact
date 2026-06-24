struct Inner {
    value: Int;
    nickname: String?;
}
struct Outer {
    count: Int;
    inner: Inner?;
    flag: Bool;
}

contract TestStorage {
    s: Outer;

    init() {
        self.s = Outer{
            count: 42,
            inner: Inner{
                value: 123,
                nickname: null
            },
            flag: true
        };
    }

    receive() {}
}