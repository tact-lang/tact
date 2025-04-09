struct NestedOpt {
    x: Int?;
    y: String?;
    z: Cell?;
}

contract OptStorage {
    val: NestedOpt;
    init() {
        self.val = NestedOpt{
            x: null,
            y: null,
            z: null,
        };
    }
}
