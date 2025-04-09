struct NestedOption {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

contract OptionInit {
    val: NestedOption;

    init() {
        self.val = NestedOption{inner: Inner{flag: true}};
    }
}