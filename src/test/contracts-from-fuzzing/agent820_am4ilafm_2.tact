struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
    flag: Bool;
}

struct Level1 {
    l2: Level2;
    sval: String;
}

contract MultiNested {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{x: 42},
                flag: true
            },
            sval: "nested"
        };
    }
}