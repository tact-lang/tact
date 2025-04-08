struct Level3 {
    a: Int;
}

struct Level2 {
    x: Int?;
    y: Bool?;
    z: String?;
    deep: Level3?;
}

struct Level1 {
    inner: Level2?;
    name: String;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                x: null,
                y: false,
                z: null,
                deep: Level3{
                    a: 999
                }
            },
            name: "nested opts"
        };
    }
}