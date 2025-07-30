// Stress test: very large deeply nested initialization for init()
struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    x: Level3;
    y: Level3?;
}

struct Level1 {
    m: Level2;
    n: Level2?;
}

contract DeepStress {
    field: Level1;

    init() {
        self.field = Level1{
            m: Level2{
                x: Level3{ a:5, b:true },
                y: null
            },
            n: null
        };
    }
}