struct DeepOption {
    nestedOpt: DeepInner?;
}

struct DeepInner {
    flag: Bool;
    value: Int;
}

contract TestDeepOption {
    persistent: DeepOption;

    init() {
        self.persistent = DeepOption{
            nestedOpt: DeepInner{
                flag: true,
                value: 99
            }
        };
    }
}