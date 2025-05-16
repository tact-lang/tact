struct WrappedOpt {
    inner: String?;
}

struct HasWrappedOpt {
    wrapper: WrappedOpt;
}

contract NestedOptionals {
    val: HasWrappedOpt;

    init() {
        self.val = HasWrappedOpt{ wrapper: WrappedOpt{ inner: null } };
    }
}