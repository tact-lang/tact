struct Level3 {
    x: Int;
    y: String;
}

struct Level2 {
    l3: Level3;
    val: Int?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract TestContract {
    root: Level1 = Level1{
        l2: Level2{
            l3: Level3{x:1, y:"s"},
            val: null
        },
        flag: true
    };

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{x:2, y:"t"},
                val: 10
            },
            flag: false
        };
    }
    receive() {}
}