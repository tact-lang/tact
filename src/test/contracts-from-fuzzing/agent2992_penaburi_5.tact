struct Level3 {
    f1: Int;
    f2: Bool;
}

struct Level2 {
    embedded: Level3;
    s: String;
}

struct Level1 {
    deep: Level2;
    amount: Int;
}

contract NestOpt {
    data: Level1?;
    
    init() {
        self.data = Level1{
            deep: Level2{
                embedded: Level3{ f1: 7, f2: true },
                s: "ok"
            },
            amount: -17
        };
    }
}
