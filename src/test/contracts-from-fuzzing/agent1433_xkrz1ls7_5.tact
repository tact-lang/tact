struct Level3 {
    val: Int;
}

struct Level2 {
    child: Level3;
    flag: Bool;
}

struct Level1 {
    inner: Level2;
    note: String;
}

contract TestContract {
    nested: Level1;
    init() {
        self.nested = Level1{
            inner: Level2{
                child: Level3{ val: 42 },
                flag: false
            },
            note: "deep"
        };
    }
}