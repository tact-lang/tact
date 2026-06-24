struct DeepBoolOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract TestContract {
    val: DeepBoolOpt;

    init() {
        self.val = DeepBoolOpt{nested: null};
    }
}