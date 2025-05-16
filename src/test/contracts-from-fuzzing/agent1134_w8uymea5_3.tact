struct Level2 {
    val: Int;
    flag: Bool;
}

struct Level1 {
    a: Level2;
    b: String;
}

contract DeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            a: Level2{
                val: 777,
                flag: true
            },
            b: "deep"
        };
    }
}