struct DeepNestLevel3 { val3: Int; }
struct DeepNestLevel2 { level3: DeepNestLevel3; }
struct DeepNestLevel1 { level2: DeepNestLevel2; }

contract ContractDeepNest {
    nest: DeepNestLevel1;
    init() {
        self.nest = DeepNestLevel1{ level2: DeepNestLevel2{ level3: DeepNestLevel3{ val3: 999 } } };
    }
}