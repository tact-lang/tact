struct MultiNested {
    a: Level1;
    b: Level1;
}

struct Level1 {
    c: Level2;
    d: Level2;
}

struct Level2 {
    e: Int;
    f: Int?;
}

contract TestContract {
    val: MultiNested;

    init() {
        self.val = MultiNested{
            a: Level1{ c: Level2{ e:1, f:null }, d: Level2{ e:2, f:null } },
            b: Level1{ c: Level2{ e:3, f:null }, d: Level2{ e:4, f:null } }
        };
    }
}