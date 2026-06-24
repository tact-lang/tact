struct DeepNested3 { x: Int }

struct DeepNested2 { d3: DeepNested3 }

struct DeepNested1 { d2: DeepNested2 }

contract DeeplyNestedStructs {
    nested: DeepNested1;

    init() {
        self.nested = DeepNested1{
            d2: DeepNested2{
                d3: DeepNested3{ x: 42 }
            }
        };
    }
}