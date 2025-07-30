struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    nested: NestedStruct?;
}

struct NestedStruct {
    n1: Int;
    n2: Bool;
}

contract OptionalNested {
    data: DeepOptionals;

    init() {
        self.data = DeepOptionals{
            a: 1,
            b: null,
            c: null,
            nested: NestedStruct{ n1: 5, n2: true }
        };
    }
}