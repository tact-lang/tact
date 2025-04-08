struct DeepNested {
    word: String;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    amount: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            word: "abc",
            inner: Inner{
                flag: false,
                amount: 10
            }
        };
    }
}