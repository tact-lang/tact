struct Nested {
    x: Int;
    s: String;
    inner: Inner;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    payload: Nested;

    init() {
        self.payload = Nested{
            x: 5,
            s: "abc",
            inner: Inner{ val: 1, flag: false }
        };
    }
}