struct OptionalNested {
    n1: Int?;
    n2: Bool?;
}

contract OptNestedTest {
    f1: Int?;
    f2: Bool?;
    nested: OptionalNested;
    
    init() {
        self.f1 = null;
        self.f2 = true;
        self.nested = OptionalNested{ n1: 42, n2: null };
    }
}