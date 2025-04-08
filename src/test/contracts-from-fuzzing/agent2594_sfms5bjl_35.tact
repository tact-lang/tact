struct OneField {
    a: Int;
}

struct List {
    f1: OneField;
    f2: OneField;
    f3: OneField;
    f4: OneField;
    f5: OneField;
}

contract StructArrayish {
    l: List;
    init() {
        self.l = List{
            f1: OneField{a:1},
            f2: OneField{a:2},
            f3: OneField{a:3},
            f4: OneField{a:4},
            f5: OneField{a:5}
        };
    }
}