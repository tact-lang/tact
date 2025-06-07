struct OptNested {
    val: Int;
}

struct PartialNested {
    nested: OptNested?;
    flag: Bool;
}

contract PartialNestedContract {
    storage: PartialNested;

    init() {
        self.storage = PartialNested{
            nested: OptNested{ val: 999 },
            flag: true,
        };
    }
}