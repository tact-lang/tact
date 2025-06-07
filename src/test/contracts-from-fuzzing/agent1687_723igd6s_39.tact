struct Reorder {
    f1: Int;
    f2: Bool;
    f3: Int;
}

contract FieldOrder {
    ro: Reorder;

    init() {
        self.ro = Reorder{ f3: 3, f1: 1, f2: false };
    }
}