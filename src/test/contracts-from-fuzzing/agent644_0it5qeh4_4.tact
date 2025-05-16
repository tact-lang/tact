struct InnerLevel3 { a: Int; }
struct InnerLevel2 { lvl3: InnerLevel3; }
struct InnerLevel1 { lvl2: InnerLevel2; }

contract Test {
    nested: InnerLevel1;

    init() {
        self.nested = InnerLevel1{ lvl2: InnerLevel2{ lvl3: InnerLevel3{ a: 123 } } };
    }
}