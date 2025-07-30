struct Level3 {
    a: Bool;
    b: Int;
}

struct Level2 {
    inner3: Level3;
    optInner3: Level3?;
}

struct Level1 {
    inner2: Level2;
    optInner2: Level2?;
    flag: Bool;
    count: Int;
}

contract DeepOptionals {
    state: Level1;

    init() {
        self.state = Level1{
            inner2: Level2{
                inner3: Level3{ a:true, b:1 },
                optInner3: null
            },
            optInner2: null,
            flag: false,
            count: 0
        };
    }
}