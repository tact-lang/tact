struct NestedOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract NestedOptionContract {
    store: NestedOptional?;

    init() {
        self.store = null;
    }
}