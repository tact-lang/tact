struct WithManyOptionalDeep {
    a: Int?;
    nested1: NestedOne?;
}

struct NestedOne {
    b: Bool?;
    nested2: NestedTwo?;
}

struct NestedTwo {
    s: String?;
}

contract DeepOptional {
    data: WithManyOptionalDeep;

    init() {
        self.data = WithManyOptionalDeep{
            a: 1,
            nested1: NestedOne{
                b: true,
                nested2: NestedTwo{
                    s: null
                }
            }
        };
    }
}
