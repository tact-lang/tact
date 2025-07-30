struct DeepOpt {
    inner: NestedOpt?;
}

struct NestedOpt {
    flag: Bool?;
}

contract OptStorage {
    val: DeepOpt?;

    init() {
        self.val = DeepOpt { inner: NestedOpt { flag: true } };
    }
}