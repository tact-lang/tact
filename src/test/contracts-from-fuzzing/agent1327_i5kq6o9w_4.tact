struct NestedA {
    na: Int;
    nb: String?;
}

struct NestedB {
    nb1: Bool;
    nb2: NestedA;
}

contract StorageTest {
    field: NestedB;

    init() {
        self.field = NestedB{
            nb1: true,
            nb2: NestedA{
                na: 42,
                nb: null
            }
        };
    }
}