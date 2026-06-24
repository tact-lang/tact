message(123) InnerMsg {
    val: Int;
    text: String?;
}

struct Container {
    inner: InnerMsg?;
    note: String?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner: InnerMsg{ val: 42, text: null },
            note: "Hi"
        };
    }
}