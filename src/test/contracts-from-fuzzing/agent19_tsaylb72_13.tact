struct NestedPersistence {
    x: Int;
    y: Bool;
    z: String;
}

contract ContractWithNested {
    nested1: NestedPersistence;
    nested2: NestedPersistence;

    init() {
        self.nested1 = NestedPersistence{ x: 10, y: true, z: "one" };
        self.nested2 = NestedPersistence{ x: 20, y: false, z: "two" };
    }
}
