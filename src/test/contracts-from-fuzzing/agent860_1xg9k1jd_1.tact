struct DeepNested {
    inner: InnerOption;
}

struct InnerOption {
    maybeVal: Int?;
}

contract TestContract {
    persistent: DeepNested;

    init() {
        self.persistent = DeepNested{ inner: InnerOption{ maybeVal: null } };
    }
}