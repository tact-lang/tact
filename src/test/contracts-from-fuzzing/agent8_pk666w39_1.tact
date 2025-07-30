struct Nested {
    level2: Level2;
}

struct Level2 {
    x: Int;
    y: Int?;
}

contract DeepStorage {
    data: Nested;
    
    init() {
        self.data = Nested{
            level2: Level2{
                x: 5,
                y: null
            }
        };
    }
}