struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ a: null, b: null };
    }
}