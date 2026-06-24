struct NestedDft {
    a: Int = 7;
    b: Bool = false;
}

contract StructWithDefault {
    data: NestedDft;

    init() {
        self.data = NestedDft{ a: 8, b: true };
    }
}