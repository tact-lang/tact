struct ComplexPersistence {
    intVal: Int;
    optBool: Bool?;
    nested: NestedPers;
}

struct NestedPers {
    innerInt: Int;
    innerOptAddr: Address?;
}

contract DeepPersistence {
    data: ComplexPersistence;

    init() {
        self.data = ComplexPersistence{
            intVal: 100,
            optBool: null,
            nested: NestedPers{
                innerInt: 200,
                innerOptAddr: null
            }
        };
    }

    receive() {}
}