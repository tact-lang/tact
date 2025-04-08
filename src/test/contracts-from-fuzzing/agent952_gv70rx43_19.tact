struct Nested {
    level1: Int;
    level2: Int;
    level3: Int;
}

contract DefaultsOverride {
    x: Int = 1;
    y: Int = 2;
    n: Nested = Nested{
        level1: 3,
        level2: 4,
        level3: 5
    };

    init() {
        self.x = 10;
        self.y = 20;
        self.n = Nested{
            level1: 30,
            level2: 40,
            level3: 50
        };
    }
}
