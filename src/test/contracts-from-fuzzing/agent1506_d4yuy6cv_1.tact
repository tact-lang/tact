struct NestedOpt {
    innerOpt: Int?;
}

contract Test {
    field1: Int = 1;
    field2: Bool = true;
    field3: NestedOpt;

    init() {
        self.field3 = NestedOpt{ innerOpt: null };
    }
}

// This tests nested optional inside persistent field's struct