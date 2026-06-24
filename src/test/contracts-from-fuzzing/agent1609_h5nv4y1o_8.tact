// test one large nested struct with many optional layers
struct Level1 {
    a: Int?;
    b: Bool?;
}

struct Level2 {
    sub: Level1;
    c: Int?;
}

struct Level3 {
    sub: Level2;
    d: Int?;
    e: Bool?;
}

contract TestContract {
    deep: Level3;

    init() {
        self.deep = Level3{
            sub: Level2{
                sub: Level1{
                    a: null,
                    b: true
                },
                c: null
            },
            d: 99,
            e: null
        };
    }

    receive() {
        self.deep = Level3{
            sub: Level2{
                sub: Level1{
                    a: 123,
                    b: false
                },
                c: 7
            },
            d: null,
            e: true
        };
    }
}