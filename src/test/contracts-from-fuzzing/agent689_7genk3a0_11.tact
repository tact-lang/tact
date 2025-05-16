struct NestedDefaulted {
    a: Int = 1;
    b: Bool = false;
}

contract StructDefaultInit {
    s: NestedDefaulted;
    init() {
        self.s = NestedDefaulted{};
    }
}