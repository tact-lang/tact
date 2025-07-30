struct Level3 {
    q: String;
}

struct Level2 {
    p: Bool;
    l3: Level3;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            a: 7,
            b: Level2{
                p: true,
                l3: Level3{
                    q: "x"
                }
            }
        };
    }

    receive() {}
}