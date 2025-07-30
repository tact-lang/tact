struct Level3 {
    a: Int as uint5;
    b: Int as int3;
}

struct Level2 {
    c: Int as uint2;
    d: Level3;
}

struct Level1 {
    e: Int;
    f: Level2;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            e:100,
            f: Level2{
                c:1,
                d: Level3{ a: 5, b: -2 }
            }
        };
    }
}