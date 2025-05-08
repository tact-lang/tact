struct NestedSome {
    level1: Int;
    level2: Int?;
    level3: Int?;
    level4: Int?;
}

contract NestedSomeContract {
    nested: NestedSome?;

    init() {
        self.nested = null;
    }
}