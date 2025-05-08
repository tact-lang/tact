struct Level4 {
    a: Int;
    b: String;
}

struct Level3 {
    l4: Level4;
    c: Bool;
}

struct Level2 {
    l3: Level3;
    d: Int;
}

struct Level1 {
    l2: Level2;
    e: String;
}

contract ManyLayered {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ a:10, b:"deep" },
                    c:true
                },
                d:20
            },
            e: "start"
        };
    }
}