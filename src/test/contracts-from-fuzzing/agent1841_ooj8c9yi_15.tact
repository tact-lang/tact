struct NestedMany {
    a: Level1;
}

struct Level1 {
    b: Level2;
    c: Int;
}

struct Level2 {
    d: Level3;
    e: Bool;
}

struct Level3 {
    f: Int?;
    g: String;
}

contract DeepMulti {
    data: NestedMany;

    init() {
        self.data = NestedMany{
            a: Level1{
                b: Level2{
                    d: Level3{f:null,g:"end"},
                    e: true
                },
                c: 33
            }
        };
    }
}
