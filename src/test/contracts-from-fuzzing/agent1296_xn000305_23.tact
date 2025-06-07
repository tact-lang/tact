// struct with many nested optionals
struct Level3 {
    x: Int?;
    y: Bool?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    val: Level1;

    init() {
        self.val = Level1{
            l2: Level2{
                l3: Level3{
                    x: null,
                    y: true,
                },
            },
        };
    }
}