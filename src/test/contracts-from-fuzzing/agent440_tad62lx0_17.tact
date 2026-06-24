struct Level3 {
    c: Int;
}
struct Level2 {
    b: Level3;
    d: Int;
}
struct Level1 {
    a: Level2;
    e: Int;
}

struct Top {
    inner: Level1;
    flag: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            inner: Level1{
                a: Level2{
                    b: Level3{ c: 5 },
                    d: 6
                },
                e: 7
            },
            flag: false
        };
    }
}