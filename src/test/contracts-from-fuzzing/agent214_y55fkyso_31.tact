struct Level3 {
    x: Int;
    y: String;
}

struct Level2 {
    a: Int;
    b: Level3;
}

struct Level1 {
    name: String;
    val: Level2;
}

contract DeepMultiFields {
    data: Level1;

    init() {
        self.data = Level1{
            name: "hi",
            val: Level2{
                a:42,
                b: Level3{
                    x:1,
                    y:"hey"
                }
            }
        };
    }
}