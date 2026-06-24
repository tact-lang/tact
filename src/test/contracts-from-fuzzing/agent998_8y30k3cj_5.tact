struct Level3 {
    deep: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestedStructTest {
    data: Level1;

    init() {
        self.data = Level1{l2: Level2{l3: Level3{deep: 777}}};
    }
}
