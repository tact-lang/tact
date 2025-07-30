// Contract with mixture of nested structs containing many primitives and optionals
struct SubNested {
    field1: Int;
    field2: Bool?;
    field3: String;
    field4: Address?;
}

struct TopNested {
    sub1: SubNested;
    sub2: SubNested;
}

contract TestContract {
    nest: TopNested;

    init() {
        self.nest = TopNested{
            sub1: SubNested{
                field1: 1,
                field2: null,
                field3: "hi",
                field4: null
            },
            sub2: SubNested{
                field1: 2,
                field2: null,
                field3: "hello",
                field4: null
            }
        };
    }
}