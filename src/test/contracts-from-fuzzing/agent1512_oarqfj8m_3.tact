struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    store: NestedOpt;

    init() {
        self.store = NestedOpt{ a: null, b: null, c: null };
    }
}