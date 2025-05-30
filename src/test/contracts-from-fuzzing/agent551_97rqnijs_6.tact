struct Level3 {
    finalVal: Int;
}

struct Level2 {
    inner: Level3;
    note: String;
}

struct Level1 {
    deeper: Level2;
    ok: Bool;
}

contract TestContract {
    bigField: Level1;
    
    init() {
        self.bigField = Level1{
            deeper: Level2{
                inner: Level3{ finalVal: 777 },
                note: "deep",
            },
            ok: true,
        };
    }
}