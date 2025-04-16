struct Level {
    a: Int?; // implicit null default
    b: Int? = null; // explicit null default
    c: Int = 10;
}

contract OptStructDefaults {
    data: Level;
    init() {
        self.data = Level{ c: 20 };
    }
}