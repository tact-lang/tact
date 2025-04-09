struct DeepNest {
    inner: Inner;
}

struct Inner {
    flag: Bool?;
    text: String;
}

contract TestContract {
    st: DeepNest;

    init() {
        self.st = DeepNest{
            inner: Inner{
                flag: null,
                text: "X"
            }
        };
    }
}