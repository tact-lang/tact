struct Level2 {
    field: Int;
}

struct Level1 {
    nested1: Level2;
    nested2: Level2;
    nested3: Level2;
    nested4: Level2;
    nested5: Level2;
}

contract ManyNestedFields {
    nestedData: Level1;

    init() {
        self.nestedData = Level1{
            nested1: Level2{ field: 1 },
            nested2: Level2{ field: 2 },
            nested3: Level2{ field: 3 },
            nested4: Level2{ field: 4 },
            nested5: Level2{ field: 5 }
        };
    }
}