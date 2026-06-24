struct NestedStr {
    s: String?;
}

contract NestedOptionalString {
    f: NestedStr?;

    init() {
        self.f = NestedStr{s:"abc"};
    }
}