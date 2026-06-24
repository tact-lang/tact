struct DeepOpt {
    nested: Inner?;
    flag: Bool;
}

struct Inner {
    id: Int;
    label: String?;
}

contract TestContract {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            nested: Inner{ id: 5, label: null },
            flag: true
        };
    }
}