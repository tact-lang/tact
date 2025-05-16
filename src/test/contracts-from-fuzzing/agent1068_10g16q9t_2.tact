struct Deep {
    level1: Bool;
    level2: String;
    level3: Int?;
    level4: Nested;
}

struct Nested {
    flag: Bool?;
    info: String;
    value: Int;
}

contract TestContract {
    data: Deep;
    
    init() {
        self.data = Deep{
            level1: true,
            level2: "test",
            level3: null,
            level4: Nested{
                flag: null,
                info: "inner",
                value: 42,
            },
        };
    }
    
    receive() {
        self.data = self.data;
    }
}
