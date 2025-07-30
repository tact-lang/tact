struct NestedLevel3 { x: Int; }

struct NestedLevel2 { lvl3: NestedLevel3; }

struct NestedLevel1 { lvl2: NestedLevel2; }

contract MultiDeepNesting {
    field: NestedLevel1;

    init() {
        self.field = NestedLevel1{ lvl2: NestedLevel2{ lvl3: NestedLevel3{ x: 42 } } };
    }
}
