struct DeepNestLevel3 { val: Int; }
struct DeepNestLevel2 { level3: DeepNestLevel3; }
struct DeepNestLevel1 { level2: DeepNestLevel2; }

contract PersistenceDeepNested {
    store: DeepNestLevel1;
    
    init() {
        self.store = DeepNestLevel1{
            level2: DeepNestLevel2{
                level3: DeepNestLevel3{ val: 999 }
            }
        };
    }
}