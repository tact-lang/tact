struct Level3 {
    val: Int?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract MultiOptionalNestedField {
    foo: Level1;

    init() {
        self.foo = Level1{
            l2: Level2{
                l3: Level3{ val: 123 }
            }
        };
    }
}
