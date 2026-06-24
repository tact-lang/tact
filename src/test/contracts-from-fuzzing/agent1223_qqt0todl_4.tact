struct Level2 {
    x: Int?; 
    y: String? = null;
}

struct Level1 {
    inner: Level2; 
    flag: Bool = false;
}

contract NestedDefaults {
    data: Level1 = Level1{
        inner: Level2{
            x: null,
            y: null,
        },
        flag: true,
    };
}