struct Level1 {
    a: Int;
}

struct Level2 {
    l1: Level1;
    b: Int?;
}

struct Level3 {
    l2: Level2;
    c: Bool;
}

struct Level4 {
    l3: Level3;
    d: Bool?;
}

contract TestContract {
    top: Level4;

    init() {
        self.top = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{
                        a: 1
                    },
                    b: null
                },
                c: true
            },
            d: null
        };
    }

    receive() {
        self.top = self.top;
    }
}