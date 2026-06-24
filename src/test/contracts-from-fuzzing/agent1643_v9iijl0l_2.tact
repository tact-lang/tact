struct Level2 {
    fieldA: Int;
    fieldB: Bool;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract MoreNestedContract {
    nestedField: Level1;
    
    init() {
        self.nestedField = Level1{
            nested: Level2{ fieldA: 10, fieldB: true },
            flag: false
        };
    }
}
