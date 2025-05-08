struct NestedMany {
    x1: Int;
    x2: String;
    x3: Bool;
    x4: Int;
    x5: String;
    x6: Bool;
}

contract CompositeStorage {
    f1: Int;
    f2: NestedMany;
    f3: Bool;

    init() {
        self.f1 = 0;
        self.f2 = NestedMany{
            x1: 1,
            x2: "xx",
            x3: true,
            x4: 2,
            x5: "yy",
            x6: false
        };
        self.f3 = true;
    }
}