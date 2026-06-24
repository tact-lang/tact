struct BoolAndStr {
    yes: Bool;
    no: Bool;
    hint: String;
}

struct ContainerSwap {
    first: BoolAndStr;
    second: BoolAndStr;
}

contract TestSwapPersistent {
    storage: ContainerSwap;

    init() {
        self.storage = ContainerSwap{
            first: BoolAndStr{ yes: true, no: false, hint: "f" },
            second: BoolAndStr{ yes: false, no: true, hint: "s" },
        };
    }
}
