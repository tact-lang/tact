struct NestedStringOpt {
    s: String?;
}

contract NestedStrOpt {
    val: NestedStringOpt;

    init() {
        self.val = NestedStringOpt{ s: null };
    }
}