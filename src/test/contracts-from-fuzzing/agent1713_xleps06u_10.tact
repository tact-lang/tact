struct VeryDeep3 { val: Int }
struct VeryDeep2 { nested: VeryDeep3 }
struct VeryDeep1 { nested: VeryDeep2 }

contract DeepNest {
    field: VeryDeep1;

    init() {
        self.field = VeryDeep1{
            nested: VeryDeep2{
                nested: VeryDeep3{ val: 42 }
            }
        };
    }
}