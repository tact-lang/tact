struct Level3 {
    leaf: Int = 777;
}

struct Level2 {
    midInt: Int = 555;
    l3: Level3 = Level3{};
}

struct Level1 {
    rootInt: Int = 123;
    l2: Level2 = Level2{};
}

contract DeepStructContract {
    deep: Level1 = Level1{};

    init() {
        self.deep = Level1{
            rootInt: 999,
            l2: Level2{
                midInt: 888,
                l3: Level3{ leaf: 7777 }
            }
        };
    }
}