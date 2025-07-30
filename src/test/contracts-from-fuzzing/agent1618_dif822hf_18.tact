struct BigNesting {
    inner: Level1;
}

struct Level1 {
    a: Int;
    b: Level2;
}

struct Level2 {
    x: Int;
    y: Level3;
}

struct Level3 {
    q: Int;
    r: Level4;
}

struct Level4 {
    p: Int;
    flag: Bool?;
}

contract TestContract {
    data: BigNesting;

    init() {
        self.data = BigNesting{
            inner: Level1{
                a: 1,
                b: Level2{
                    x: 2,
                    y: Level3{
                        q:3,
                        r: Level4{
                            p:4,
                            flag:true
                        }
                    }
                }
            }
        };
    }
}