struct Nested {
    val: Int;
    flag: Bool;
}

struct Container {
    inner: Nested;
    txt: String;
    optVal: Int?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: Nested{ val: 1, flag: true },
            txt: "hello",
            optVal: null,
        };
    }
}