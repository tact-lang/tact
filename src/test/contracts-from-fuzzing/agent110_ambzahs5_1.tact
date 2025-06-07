struct DeepNestLevel3 { c: Int; }

struct DeepNestLevel2 { b: DeepNestLevel3; }

struct DeepNestLevel1 { a: DeepNestLevel2; }

contract DeeplyNestedStructContract {
    nested: DeepNestLevel1;

    init() {
        self.nested = DeepNestLevel1{
            a: DeepNestLevel2{
                b: DeepNestLevel3{
                    c: 1,
                },
            },
        };
    }

    receive() {
        self.nested = self.nested;
    }
}