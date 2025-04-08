struct Inner {
    num: Int;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    optNum: Int?;
    text: String;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ num: 1, flag: true },
            optNum: null,
            text: "hello"
        };
    }
}