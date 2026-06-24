struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
    b: Bool;
}

struct Level1 {
    l2: Level2;
    c: String;
}

contract NestedDeep {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{
                    a: 999,
                },
                b: true,
            },
            c: "deep",
        };
    }
}