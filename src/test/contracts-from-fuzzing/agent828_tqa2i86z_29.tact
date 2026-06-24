struct DeepInner {
    p: Int;
    q: Bool;
}

struct InnerOpt {
    inner: DeepInner?;
    label: String;
}

contract TestContract {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{
            inner: DeepInner{
                p: 111,
                q: true
            },
            label: "deep test"
        };
    }
}