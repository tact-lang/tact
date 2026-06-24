struct Level3 {
    deepInt: Int;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract NestedStructs {
    inner: Level1;

    init() {
        self.inner = Level1{
            level2: Level2{
                level3: Level3{ deepInt: 42 }
            }
        };
    }
}