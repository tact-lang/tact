struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract TestStorage {
    val: NestedOpt;

    init() {
        self.val = NestedOpt{a: null, b: null};
    }
}