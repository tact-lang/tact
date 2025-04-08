struct Level3 {
    k: Int;
    l: String;
}

struct Level2 {
    i: Int?;
    j: Level3;
}

struct Level1 {
    g: Bool;
    h: Level2;
}

contract DeepOptionalNested {
    data: Level1;

    init() {
        self.data = Level1{
            g: true,
            h: Level2{
                i: null,
                j: Level3{
                    k: 10,
                    l: "nested"
                }
            }
        };
    }
}
