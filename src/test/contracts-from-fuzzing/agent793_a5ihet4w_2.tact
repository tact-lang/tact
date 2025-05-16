struct DeepNested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    val: Int;
    text: String;
}

contract TestContract {
    item: DeepNested;

    init() {
        self.item = DeepNested{
            inner: Inner{val: 7, text: "hello"},
            flag: true
        };
    }

    receive() {}
}