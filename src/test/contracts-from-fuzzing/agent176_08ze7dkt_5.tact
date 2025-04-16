struct InnerLevel3 { x: Int }
struct InnerLevel2 { l3: InnerLevel3 }
struct InnerLevel1 { l2: InnerLevel2 }

contract VeryDeepNested {
    field: InnerLevel1;
    init() {
        self.field = InnerLevel1{ l2: InnerLevel2{ l3: InnerLevel3{ x: 99 } } };
    }
}