struct Level1 {
    a: Int;
}

struct Level2 {
    inner: Level1;
    b: Int;
}

struct Level3 {
    inner: Level2;
    c: Int;
}

struct Level4 {
    inner: Level3;
    d: Int;
}

struct Level5 {
    inner: Level4;
    e: Int;
}

contract TestDeepNested {
    receive() {
        let obj: Level5 = Level5{
            inner: Level4{
                inner: Level3{
                    inner: Level2{
                        inner: Level1{ a: 100 },
                        b: 200
                    },
                    c: 300
                },
                d: 400
            },
            e: 500
        };
        return;
    }
}
