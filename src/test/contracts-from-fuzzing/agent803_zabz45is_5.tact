struct Level3 {
    deep: Bool;
}

struct Level2 {
    nested: Level3;
    optInt: Int?;
}

struct Level1 {
    inner: Level2;
    flag: Bool;
}

contract DeeplyNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                nested: Level3{ deep: true },
                optInt: null
            },
            flag: false
        };
    }
}