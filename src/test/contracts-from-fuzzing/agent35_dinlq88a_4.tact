struct Level3 {
    f1: Int?;
    f2: Bool;
    f3: String;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
    val: Int;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3a: Level3{ f1: null, f2: true, f3: "abc" },
                l3b: Level3{ f1: 123, f2: false, f3: "xyz" }
            },
            val: 999
        };
    }
}