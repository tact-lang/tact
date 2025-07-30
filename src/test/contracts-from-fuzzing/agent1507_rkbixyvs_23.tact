struct NestedNulls {
    s: String?;
    n: Int?;
}

contract NullInState {
    nest: NestedNulls?;

    init() {
        self.nest = null;
    }
}
