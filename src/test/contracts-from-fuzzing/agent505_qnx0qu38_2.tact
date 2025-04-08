struct Inner {
    val1: Bool;
    val2: String;
}

struct Outer {
    number: Int;
    inner: Inner;
    flag: Bool?;
}

contract Test {
    data: Outer = Outer{
        number: 7,
        inner: Inner{ val1: false, val2: "hi" },
        flag: null,
    };

    init() {
        self.data = Outer{
            number: 42,
            inner: Inner{ val1: true, val2: "bye" },
            flag: true,
        };
    }

    receive() {
        self.data = self.data;
    }
}