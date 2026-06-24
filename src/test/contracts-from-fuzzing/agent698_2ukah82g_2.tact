struct DeepNested {
    p: Int;
    q: Int?;
}

struct Container {
    inner: DeepNested;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            inner: DeepNested{
                p: 1,
                q: null,
            },
            flag: true,
        };
    }
}